package com.ruoyi.web.controller.common;

import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.font.GlyphVector;
import java.awt.geom.Line2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import com.google.code.kaptcha.BackgroundProducer;
import com.google.code.kaptcha.GimpyEngine;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.text.WordRenderer;
import com.ruoyi.framework.config.CaptchaConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.google.code.kaptcha.Producer;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.sign.Base64;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.system.service.ISysConfigService;

/**
 * 验证码操作处理
 *
 * @author renkai721@163.com
 */
@RestController
public class CaptchaController
{
    @Resource(name = "captchaProducer")
    private DefaultKaptcha captchaProducer;

    @Resource(name = "captchaProducerMath")
    private Producer captchaProducerMath;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ISysConfigService configService;
    /**
     * 生成验证码
     */
    @GetMapping("/captchaImage")
    public AjaxResult getCode(HttpServletResponse response) throws IOException
    {
        AjaxResult ajax = AjaxResult.success();
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        ajax.put("captchaEnabled", captchaEnabled);
        if (!captchaEnabled)
        {
            return ajax;
        }
        // 保存验证码信息
        String uuid = IdUtils.simpleUUID();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;
        String capStr = createText();
        String code = capStr;
        // 如果想要兼容以前的算术运算验证码，在这里把原来的if判断的代码添加进来就可以了。
        // 这里的代码默认直接生成字符的验证码，不在读取配置文件。
        BufferedImage image = createImage(capStr);
        redisCache.setCacheObject(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try
        {
            ImageIO.write(image, "jpg", os);
        }
        catch (IOException e)
        {
            return AjaxResult.error(e.getMessage());
        }
        ajax.put("uuid", uuid);
        ajax.put("img", Base64.encode(os.toByteArray()));
        return ajax;
    }

    private String createText()
    {
        // 验证码中的字符个数
        int num = 4;
        // 验证码中允许出现的字符
        char[] chars = "0123456789".toCharArray();
        Random rand = new SecureRandom();
        StringBuffer text = new StringBuffer();
        for (int i = 0; i < num; i++)
        {
            text.append(chars[rand.nextInt(chars.length)]);
        }
        return text.toString();
    }
    private BufferedImage createImage(String text)
    {
        boolean isBorderDrawn = captchaProducer.getConfig().isBorderDrawn();
        // 验证码背景图片宽度，高度
        int width = 180;
        int height = 60;
        BufferedImage bi = renderWord(text, width, height);
        bi = addBackground(bi);
        Graphics2D graphics = bi.createGraphics();
        if (isBorderDrawn)
        {
            drawBox(graphics,width,height);
        }
        return bi;
    }
    private BufferedImage renderWord(String word, int width, int height)
    {
        // 验证码字符的文字大小
        int fontSize = 48;
        // 验证码字符的字体
        Font font = new Font("微软雅黑", Font.BOLD, fontSize);
        // 验证码单个字符之间的距离
        int charSpace = 10;
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2D = image.createGraphics();
        // 验证码字符的颜色
        g2D.setColor(new Color(23,118,205));
        RenderingHints hints = new RenderingHints(
                RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
        hints.add(new RenderingHints(RenderingHints.KEY_RENDERING,
                RenderingHints.VALUE_RENDER_QUALITY));
        g2D.setRenderingHints(hints);
        FontRenderContext frc = g2D.getFontRenderContext();
        int startPosY = (height - fontSize) / 5 + fontSize;
        char[] wordChars = word.toCharArray();
        Font[] chosenFonts = new Font[wordChars.length];
        int [] charWidths = new int[wordChars.length];
        int widthNeeded = 0;
        for (int i = 0; i < wordChars.length; i++)
        {
            chosenFonts[i] = font;
            char[] charToDraw = new char[]{
                    wordChars[i]
            };
            GlyphVector gv = chosenFonts[i].createGlyphVector(frc, charToDraw);
            charWidths[i] = (int)gv.getVisualBounds().getWidth();
            if (i > 0)
            {
                widthNeeded = widthNeeded + 2;
            }
            widthNeeded = widthNeeded + charWidths[i];
        }
        int startPosX = (width - widthNeeded) / 2;
        for (int i = 0; i < wordChars.length; i++)
        {
            g2D.setFont(font);
            char[] charToDraw = new char[] {
                    wordChars[i]
            };
            g2D.drawChars(charToDraw, 0, charToDraw.length, startPosX, startPosY);
            startPosX = startPosX + (int) charWidths[i] + charSpace;
        }

        return image;
    }

    private void drawBox(Graphics2D graphics, int width, int height)
    {
        Color borderColor = captchaProducer.getConfig().getBorderColor();
        int borderThickness = captchaProducer.getConfig().getBorderThickness();
        graphics.setColor(borderColor);
        if (borderThickness != 1)
        {
            BasicStroke stroke = new BasicStroke((float) borderThickness);
            graphics.setStroke(stroke);
        }
        // 验证码DIV的边框颜色
        graphics.setColor(new Color(192,196,204));
        graphics.setBackground(Color.white);
        Line2D line1 = new Line2D.Double(0, 0, 0, width);
        graphics.draw(line1);
        Line2D line2 = new Line2D.Double(0, 0, width, 0);
        graphics.draw(line2);
        line2 = new Line2D.Double(0, height - 1, width, height - 1);
        graphics.draw(line2);
        line2 = new Line2D.Double(width - 1, height - 1, width - 1, 0);
        graphics.draw(line2);
    }

    private BufferedImage addBackground(BufferedImage baseImage)
    {
        // 验证码的背景颜色，从from到to的颜色过渡
        Color colorFrom = Color.white;
        Color colorTo = Color.white;
        int width = baseImage.getWidth();
        int height = baseImage.getHeight();
        BufferedImage imageWithBackground = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);

        Graphics2D graph = (Graphics2D) imageWithBackground.getGraphics();
        RenderingHints hints = new RenderingHints(
                RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_OFF);

        hints.add(new RenderingHints(RenderingHints.KEY_COLOR_RENDERING,
                RenderingHints.VALUE_COLOR_RENDER_QUALITY));
        hints.add(new RenderingHints(RenderingHints.KEY_ALPHA_INTERPOLATION,
                RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY));

        hints.add(new RenderingHints(RenderingHints.KEY_RENDERING,
                RenderingHints.VALUE_RENDER_QUALITY));

        graph.setRenderingHints(hints);

        GradientPaint paint = new GradientPaint(0, 0, colorFrom, width, height,
                colorTo);
        graph.setPaint(paint);
        graph.fill(new Rectangle2D.Double(0, 0, width, height));
        graph.drawImage(baseImage, 0, 0, null);
        return imageWithBackground;
    }

}