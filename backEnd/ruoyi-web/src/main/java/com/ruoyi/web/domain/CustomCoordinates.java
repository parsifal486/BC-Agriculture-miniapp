package com.ruoyi.web.domain;

import java.util.Random;

public class CustomCoordinates {
    private Point startPoint;
    private Point midPoint;
    private Point endPoint;

    public static CustomCoordinates generateRandomCoordinates(CustomCoordinates.Point midPoint) {
        Random random = new Random();

        float startX = midPoint.getX() + random.nextFloat() * 3.0f - 1.5f;
        float startY = midPoint.getY() + random.nextFloat() * 3.0f - 1.5f;
        CustomCoordinates.Point startPoint = new CustomCoordinates.Point(startX, startY);

        float endX = midPoint.getX() + random.nextFloat() * 3.0f - 1.5f;
        float endY = midPoint.getY() + random.nextFloat() * 3.0f - 1.5f;
        CustomCoordinates.Point endPoint = new CustomCoordinates.Point(endX, endY);

        return new CustomCoordinates(startPoint, midPoint, endPoint);
    }


    public CustomCoordinates(Point startPoint, Point midPoint, Point endPoint) {
        this.startPoint = startPoint;
        this.midPoint = midPoint;
        this.endPoint = endPoint;
    }

    public Point getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(Point startPoint) {
        this.startPoint = startPoint;
    }

    public Point getMidPoint() {
        return midPoint;
    }

    public void setMidPoint(Point midPoint) {
        this.midPoint = midPoint;
    }

    public Point getEndPoint() {
        return endPoint;
    }

    public void setEndPoint(Point endPoint) {
        this.endPoint = endPoint;
    }

    public static class Point {
        private float x;
        private float y;

        public Point(float x, float y) {
            this.x = x;
            this.y = y;
        }

        public float getX() {
            return x;
        }

        public void setX(float x) {
            this.x = x;
        }

        public float getY() {
            return y;
        }

        public void setY(float y) {
            this.y = y;
        }

        @Override
        public String toString() {
            return "Point{" +
                    "x=" + x +
                    ", y=" + y +
                    '}';
        }
    }

    @Override
    public String toString() {
        return "CustomCoordinates{" +
                "startPoint=" + startPoint +
                ", midPoint=" + midPoint +
                ", endPoint=" + endPoint +
                '}';
    }
}