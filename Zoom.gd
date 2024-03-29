extends Camera2D
#Godot uses pixels, so this is a percentage 4 = 4%
export var PaddingPercent = 4
var MaxX = -INF

func CalculateBox(InScreenSize):
	#infinity for the min max formulas to work
	var MinX = INF
	MaxX = -INF
	var MinY = INF
	var MaxY = -INF
	#The way this works is it keeps the data from the nodes with the lowest -x,-y and highest x,y
	for eachChild in get_node("../../Chars").get_children():
		#Will only work with 2D, 3D needs transform.origin
		var pos = eachChild.position

		MinX = min(MinX,pos.x) # if pos.x is less than infinty keep it
		MaxX = max(MaxX,pos.x) # if pos.x is more than negative infinty keep it

		MinY = min(MinY,pos.y) # the next pass it compares the old kept value with the new
		MaxY = max(MaxY,pos.y) # keeping the most relavent number for that corner

	#Because Godot uses pixels we have to correct it
	var CorrectPixel =(InScreenSize /100) * PaddingPercent

	#Godot doesn't have a MinMaxRect but we can use a list
	var FourPointList = [
	MinX - CorrectPixel.y , 
	MaxX + CorrectPixel.y , 
	MinY - CorrectPixel.y , 
	MaxY + CorrectPixel.y ]
	#This will return a Rect2
	return Rect2From4PointList(FourPointList)


#Special function for making a rect2 from the list
func Rect2From4PointList(InList):
	#Formula AX+BX/2 AY+BY/2 
	var Center = Vector2( ((InList[0] + InList[1]) /2), ((InList[3] + InList[2]) /2) )
	#Formula BX-AX BY-AY 
	var Size = Vector2( (InList[1] -InList[0]), (InList[3] - InList[2]) )
	return Rect2(Center,Size)


func _process(delta):
	#You must have a camera 2D for this to work
	var ActiveCamera = self
	var ScreenSize = self.get_viewport().size

	#This function will have to update every frame
	var CustomRect2 = CalculateBox(ScreenSize)

	var ZoomRatio = max(CustomRect2.size.x/ ScreenSize.x, CustomRect2.size.y/ ScreenSize.y)
	
	var smooth = 0.075
	var target_pos = CustomRect2.position
	target_pos.x = MaxX
	target_pos.y += 200
	ActiveCamera.offset = ActiveCamera.offset.linear_interpolate(target_pos, smooth)
	#ZoomRatio is a scalar so we need to turn it into a vector
	var ClampedZoom =  Vector2(1,1) * clamp(ZoomRatio, 1, 3.0)
	
	ActiveCamera.zoom = ActiveCamera.zoom.linear_interpolate(ClampedZoom, smooth)
