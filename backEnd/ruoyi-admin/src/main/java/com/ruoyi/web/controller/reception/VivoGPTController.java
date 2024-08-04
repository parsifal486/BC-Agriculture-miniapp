package com.ruoyi.web.controller.reception;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.utils.vivoGpt.VivoGPTClient;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Map;

import static com.ruoyi.common.utils.vivoGpt.VivoGPTClient.*;

@RestController
public class VivoGPTController extends BaseController {

    private VivoGPTClient vivoGPTClient;

    @GetMapping("/front/vivo/pictureID")
    public String getId(@Param("quest") String quest)
    {

         return getPictureId(quest);

    }

    @GetMapping("/front/vivo/picture")
    public Object getPicture(@Param("quest") String quest)
    {
        return pictureGenerate(quest);

    }


    @GetMapping("/front/vivo/content")
    public String content(@Param("quest") String quest)
    {
       return  contentGenerate(quest);
    }

}
