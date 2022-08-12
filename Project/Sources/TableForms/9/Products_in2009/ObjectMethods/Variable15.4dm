If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.Variable15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_PICTURE:C286(PRD_Pic_Graphic; PRD_pic_GraphicLGE)
	C_TEXT:C284($_t_oldMethodName; PROD_t_GraphicPath)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.Variable15"; Form event code:C388)
If (Picture size:C356(PRD_Pic_Graphic)>0)
	
	READ PICTURE FILE:C678(PROD_t_GraphicPath; PRD_pic_GraphicLGE)
	Picture_expand(->PRD_pic_GraphicLGE; "Product Picture")
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.Variable15"; $_t_oldMethodName)
