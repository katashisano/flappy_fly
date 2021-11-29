package;

import openfl.events.MouseEvent;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.Lib;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.display.Sprite;
import Random;

class Main extends Sprite {
    public function new() {
        super();

        var score = 1;
        var scoreDisplay = new TextField();

        var scoreFormat = new TextFormat("Assets/Font/Montserrat-Black.ttf", 24, 0xFFFFFF, true);
        scoreDisplay.setTextFormat(scoreFormat);
        scoreDisplay.selectable = false;

        scoreDisplay.x = 4;
        scoreDisplay.y = 4;

        for (i in 0...8) {
            SpawnSystem.SpawnSprite(i * 16 * 4, stage.stageHeight - 16 * 4 * 2, 4, 4, "Assets/Images/ground_top.png", this);
            SpawnSystem.SpawnSprite(i * 16 * 4, stage.stageHeight - 16 * 4, 4, 4, "Assets/Images/ground.png", this);
        }
        var ground = [];

        var p_container = new Sprite();

        var fly = Assets.getBitmapData("Assets/Images/fly.png");
        var flyFlap = Assets.getBitmapData("Assets/Images/fly_flap.png");
        var player = new Bitmap(fly);
        player.scaleX = 6;
        player.scaleY = 6;
        player.x = -(player.width / 2);
        player.y = -(player.height / 2);
        p_container.x = 50 + player.width / 2;
        p_container.y = 120 + player.width / 2;
        
        var p_dy:Float = 0;
        var p_maxDy:Float = -20;
        var gravity:Float = -0.4;

        p_container.addChild(player);
        this.addChild(p_container);

        this.addChild(scoreDisplay);

        var groundSpeed = 3;
        for (i in 0...16)
            ground.push(this.getChildAt(i));

        var p_rSpeed = 0.0;
        var p_rSpeedDelta = 0.2;
        
        var flap_anim = false;

        var obstacle_container = new Sprite();

        var obstacle_spawnInterval = 10;
        var obstacle_time = 0.0;

        var obstacles = [];
        
        Lib.current.stage.addEventListener(Event.ENTER_FRAME, function(e:Event) {
            for (i in 0...ground.length) {
                    ground[i].x -= groundSpeed;
                    if (ground[i].x < -16 * 4)
                        ground[i].x += 16 * 4 * 8;
            }

            if (p_dy > p_maxDy) {
                p_dy += gravity;
            }

            if (p_dy < 0)
                player.bitmapData = fly;
            else if (p_dy > 0)
                player.bitmapData = flyFlap;

            p_container.y -= p_dy;

            if (p_container.y + 45 > ground[0].y)
                p_container.y = 120;

            p_rSpeed += p_rSpeedDelta;
            p_container.rotation += p_rSpeed;
            
            if (p_container.rotation > 360) {
                flap_anim = false;
                p_container.rotation -= 360;
            }
            if (!flap_anim && p_container.rotation > 90)
                p_container.rotation = 90;

            score += 1;

            scoreDisplay.text = "SCORE: " + score;
            scoreDisplay.setTextFormat(scoreFormat);

            obstacle_time += 0.1;
            if (obstacle_time > obstacle_spawnInterval) {
                obstacles.push(SpawnSystem.SpawnObstacle(470, Random.float(-64, 0), 4, 4, obstacle_container));
                obstacle_time -= obstacle_spawnInterval;
            }
            for (i in 0...obstacles.length)
                obstacles[i].x -= groundSpeed;
            
            if (obstacles[0].x < this.x-64)
                obstacle_container.removeChildAt(0);
        });
        this.addChild(obstacle_container);
        
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent) {
            if (e.keyCode == Keyboard.SPACE || e.keyCode == Keyboard.W || e.keyCode == Keyboard.UP) {
                p_dy = 6;

                p_rSpeed = 0;
                p_container.rotation = 300;
                flap_anim = true;
            }
        });
        
        Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent) {
            p_dy = 6;
            
            p_rSpeed = 0;
            p_container.rotation = 300;
            flap_anim = true;
        });
    }
}