package;

import openfl.display.DisplayObject;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.Assets;

class SpawnSystem extends Sprite {
    public static function SpawnSprite(xPos:Float, yPos:Float, scaleX:Float, scaleY:Float, sprite:String, container:DisplayObjectContainer) {
        
        var instance = new Bitmap(Assets.getBitmapData(sprite));
        
        instance.x = xPos;
        instance.y = yPos;
        instance.scaleX = scaleX;
        instance.scaleY = scaleY;

        container.addChild(instance);
    }

    public static function SpawnObstacle(xPos:Float, yPos:Float, scaleX:Float, scaleY:Float, container:DisplayObjectContainer) {
        
        var s_pipe = Assets.getBitmapData("Assets/Images/pipe.png");
        var s_pipe_semi_top = Assets.getBitmapData("Assets/Images/pipe_semi-top.png");
        var s_pipe_top = Assets.getBitmapData("Assets/Images/pipe_top.png");

        var obstacle = new Sprite();

        // MAX VERTICAL PIPE COUNT ON-SCREEN: 10
        // Make and obstacle 1x11 pipes, 1 tile only for the player to pass through
        //top
        var pipe_top = new Bitmap(s_pipe_top);
        pipe_top.scaleX = scaleX;
        pipe_top.scaleY = scaleY;
        pipe_top.x = xPos + pipe_top.width;
        pipe_top.y = yPos + pipe_top.height * 5;
        pipe_top.rotation = 180;

        var pipe_semi_top = new Bitmap(s_pipe_semi_top);
        pipe_semi_top.scaleX = scaleX;
        pipe_semi_top.scaleY = scaleY;
        pipe_semi_top.x = xPos + pipe_semi_top.width;
        pipe_semi_top.y = yPos + pipe_semi_top.height * 4;
        pipe_semi_top.rotation = 180;
        
        var pipe0 = new Bitmap(s_pipe);
        pipe0.scaleX = scaleX;
        pipe0.scaleY = scaleY;
        pipe0.x = xPos + pipe0.width;
        pipe0.y = yPos + pipe0.height * 3;
        pipe0.rotation = 180;

        var pipe1 = new Bitmap(s_pipe);
        pipe1.scaleX = scaleX;
        pipe1.scaleY = scaleY;
        pipe1.x = xPos + pipe1.width;
        pipe1.y = yPos + pipe1.height * 2;
        pipe1.rotation = 180;
        
        var pipe2 = new Bitmap(s_pipe);
        pipe2.scaleX = scaleX;
        pipe2.scaleY = scaleY;
        pipe2.x = xPos + pipe2.width;
        pipe2.y = yPos + pipe2.height;
        pipe2.rotation = 180;


        //bottom

        var l_pipe_top = new Bitmap(s_pipe_top);
        l_pipe_top.scaleX = scaleX;
        l_pipe_top.scaleY = scaleY;
        l_pipe_top.x = xPos;
        l_pipe_top.y = yPos + l_pipe_top.height * 6;

        var l_pipe_semi_top = new Bitmap(s_pipe_semi_top);
        l_pipe_semi_top.scaleX = scaleX;
        l_pipe_semi_top.scaleY = scaleY;
        l_pipe_semi_top.x = xPos;
        l_pipe_semi_top.y = yPos + l_pipe_semi_top.height * 7;
        
        var l_pipe0 = new Bitmap(s_pipe);
        l_pipe0.scaleX = scaleX;
        l_pipe0.scaleY = scaleY;
        l_pipe0.x = xPos;
        l_pipe0.y = yPos + l_pipe0.height * 8;

        var l_pipe1 = new Bitmap(s_pipe);
        l_pipe1.scaleX = scaleX;
        l_pipe1.scaleY = scaleY;
        l_pipe1.x = xPos;
        l_pipe1.y = yPos + l_pipe1.height * 9;
        
        var l_pipe2 = new Bitmap(s_pipe);
        l_pipe2.scaleX = scaleX;
        l_pipe2.scaleY = scaleY;
        l_pipe2.x = xPos;
        l_pipe2.y = yPos + l_pipe2.height * 10;

        obstacle.addChild(pipe_top);
        obstacle.addChild(pipe_semi_top);
        obstacle.addChild(pipe0);
        obstacle.addChild(pipe1);
        obstacle.addChild(pipe2);
        obstacle.addChild(l_pipe_top);
        obstacle.addChild(l_pipe_semi_top);
        obstacle.addChild(l_pipe0);
        obstacle.addChild(l_pipe1);
        obstacle.addChild(l_pipe2);
        container.addChild(obstacle);

        return obstacle;
    }
}