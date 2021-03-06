package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class RandomMap extends Sprite {
		private const MIN_TILES:int = 750;
		private var tilesPlaced:int;
		private var tilesToProcess:int;
		private var adjacentCells:int;
		private var startX:int;
		private var startY:int;
		private var mapWidth:int = 64;
		private var mapHeight:int = 48;
		private var tileSize:int = 20;
		private var turnRatio:Number = 0.25;
		private var randomDirections:Array;
		private var theCave:Array;
		private var theCaveCopy:Array;
		private var offsetX:int = 0;
		private var offsetY:int = 0;
		
		public function RandomMap() {
			setupCave();
			generateCave();
			
			for (var m:int = 0; m < mapWidth; m++) {
				for (var n:int = 0; n < mapHeight; n++) {
					if (m == 0 || n == 0 || m == (mapWidth - 1) || n == (mapHeight - 1)) {
						theCave[m][n] = 0;
					}
				}
			}
			setupLaunchPoint();
			remakeInRectangles();
		}
		
		private function setupLaunchPoint():void {
			var possiblePoints:Array = [];
			for (var m:int = 1; m < mapWidth - 1; m++) {
				for (var n:int = 1; n < mapHeight - 1; n++) {
					if (theCave[m][n] == 1) {
						if (theCave[m + 1][n] + 
							theCave[m - 1][n] + 
							theCave[m][n + 1] + 
							theCave[m][n - 1] == 1) {
							
							if (theCave[m][n + 1] == 0) {
								possiblePoints.push(new Point(60 * m + 15, 60 * n + 15));
							}
						}
					}
				}
			}
			var randomInt:int = Math.random() * possiblePoints.length;
			var locToSpawn:Point = possiblePoints[randomInt];
			locToSpawn.x /= 30;
			locToSpawn.y /= 30;
			LevelDirector.currentLevel.setSpawnLoc(locToSpawn.x, locToSpawn.y);
			possiblePoints.splice(randomInt, 1);
			for (m = 1; m < mapHeight - 1; m++) {
				for (n = 1; n < mapWidth - 1; n++) {
					if (theCave[m][n] == 0) {
						if (theCave[m + 1][n] + 
							theCave[m - 1][n] + 
							theCave[m][n + 1] + 
							theCave[m][n - 1] + 
							theCave[m + 1][n + 1] + 
							theCave[m + 1][n - 1] + 
							theCave[m - 1][n + 1] + 
							theCave[m - 1][n - 1] == 8) {
							
							possiblePoints.push(new Point(60 * (m + 1) + 15, 60 * n + 15));
							possiblePoints.push(new Point(60 * (m - 1) + 15, 60 * n + 15));
							possiblePoints.push(new Point(60 * m + 15, 60 * (n + 1) + 15));
							possiblePoints.push(new Point(60 * m + 15, 60 * (n - 1) + 15));
						}
					}
				}
			}
			for each (var point:Point in possiblePoints) {
				new BubbleBonus((point.x - 15) / 30 + 1, (point.y - 15) / 30 + 1);
			}
			addCheckpoint();
		}
		
		public function addCheckpoint():void {
			var possiblePoints:Array = [];
			for (var m:int = 1; m < mapHeight - 1; m++) {
				for (var n:int = 1; n < mapWidth - 1; n++) {
					if (theCave[m][n] == 1) {
						possiblePoints.push(new Point(60 * m + 15, 60 * n + 15));
					}
				}
			}
			var point:Point = possiblePoints[Math.floor(Math.random() * possiblePoints.length - 1)];
			new BubbleBonus((point.x - 15) / 30 + 1, (point.y - 15) / 30 + 1);
		}
		
		private function remakeInRectangles():void {
			var counter:int = 0;
			var m:int;
			var n:int;
			theCaveCopy = new Array();
			for (var i:int = 0; i < mapWidth; i++) {
				theCaveCopy[i] = new Array();
				for (var j:int = 0; j < mapHeight; j++) {
					theCaveCopy[i][j] = theCave[i][j];
				}
			}
			for (m = 0; m < mapHeight; m++) {
				for (n = 0; n < mapWidth; n++) {
					if (theCaveCopy[n][m] == 0) {
						var a:int = n;
						while (theCaveCopy[a][m] == 0) {
							if ((a + 1) < mapWidth) {
								a++;
							} else {
								a++;
								break;
							}
						}
						var b:int = m;
						var error:Boolean = false;
						while (error == false) {
							for (var p:int = n; p < a; p++) {
								if (theCaveCopy[p][b] != 0) {
									error = true;
									break;
								}
							}
							if (!error) {
								if ((b + 1) < mapHeight) {
									b++;
								} else {
									b++;
									error = true;
									break;
								}
							}
						}
						counter++;
						new Standard(2 * n, 2 * m, 2 * (a - n), 2 * (b - m));
						for (var o:int = m; o < b; o++) {
							for (var q:int = n; q < a; q++) {
								theCaveCopy[q][o] = 1;
							}
						}
					}
				}
			}
		}
		
		private function generateCave():void {
			randomDirections = shuffle([0, 1, 2, 3]);
			tilesPlaced = 1;
			startX = Math.round(mapWidth / 2);
			startY = Math.round(mapHeight / 2);
			while (tilesPlaced < MIN_TILES) {
				tilesToProcess = 1;
				drawCave();
				do {
					startX = Math.floor(Math.random() * mapWidth);
					startY = Math.floor(Math.random() * mapHeight);
				} while (!hasFreeAdjacents());
			}
		}
		
		private function hasFreeAdjacents():Boolean {
			if (theCave[startX][startY] == 0) {
				return false;
			}
			if (theCave[startX][startY + 1] == 0) {
				return true;
			}
			if (theCave[startX][startY - 1] == 0) {
				return true;
			}
			if (theCave[startX + 1] != undefined && 
				theCave[startX + 1][startY] == 0) {
				
				return true;
			}
			if (theCave[startX - 1] != undefined && 
				theCave[startX - 1][startY] == 0) {
				
				return true;
			}
			return false;
		}
		
		private function drawCave():void {
			drawTile(startX, startY);
			var xCoordsArray:Array = [startX];
			var yCoordsArray:Array = [startY];
			var xOffset:Array = [-1, 0, 1, 0];
			var yOffset:Array = [0, -1, 0, 1];
			while (tilesToProcess > 0) {
				var currentX = xCoordsArray.pop();
				var currentY = yCoordsArray.pop();
				adjacentCells = getAdjacentCells(tilesToProcess);
				if (adjacentCells > 0) {
					if (Math.random() < turnRatio) {
						randomDirections = shuffle(randomDirections);
					}
					for (var j:int = 0; j < 4; j++) {
						var adjacentX:int = currentX + xOffset[randomDirections[j]];
						var adjacentY:int = currentY + yOffset[randomDirections[j]];
						if (adjacentX >= 0 && adjacentX < mapWidth && 
							adjacentY >= 0 && adjacentY < mapHeight && 
							theCave[adjacentX][adjacentY] == 0) {
							
							xCoordsArray.push(adjacentX);
							yCoordsArray.push(adjacentY);
							tilesPlaced++;
							drawTile(adjacentX, adjacentY);
							tilesToProcess++;
							adjacentCells--;
							if (adjacentCells == 0) {
								break;
							}
						}
					}
				}
				tilesToProcess--;
			}
		}
		
		private function setupCave():void {
			theCave = new Array();
			for (var i:int = 0; i < mapWidth; i++) {
				theCave[i] = new Array();
				for (var j:int = 0; j < mapHeight; j++) {
					theCave[i][j] = 0;
				}
			}
		}
		
		private function drawTile(col:int, row:int):void {
			theCave[col][row] = 1;
		}
		
		private function getAdjacentCells(num:int):int {
			var wayOuts:int = Math.round(Math.floor(Math.random() * 4) / 2 + 0.1);
			if (num == 1 && wayOuts == 0) {
				wayOuts = 1;
			}
			return (wayOuts);
		}
		
		private function shuffle(startArray:Array):Array {
			var suffledArray:Array = new Array();
			while (startArray.length > 0) {
				suffledArray.push(startArray.splice(Math.floor(Math.random() * startArray.length), 1));
			}
			return suffledArray;
		}
	}
}