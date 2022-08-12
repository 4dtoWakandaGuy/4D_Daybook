If (False:C215)
	//object Name: [DOCUMENTS]Letters_inW.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(Write)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Letters_inW.Variable3"; Form event code:C388)
CONFIRM:C162("Do you wish to modify this template, a revised copy of the template will be made"; "No"; "Yes")

If (OK=0)
	DUPLICATE RECORD:C225([DOCUMENTS:7])
	//the document should be loaded
	Set_DocumentCode(4)
	[DOCUMENTS:7]Standard:9:=True:C214
	[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
	[DOCUMENTS:7]Document_Class:14:=(Abs:C99([DOCUMENTS:7]Document_Class:14))
	[DOCUMENTS:7]Document_Status:15:=1
	WR PICTURE TO AREA:P12000:141(Write; [DOCUMENTS:7]Write_:5)
	DOC_SetWriteModifiable(Write; 1; True:C214)
	DB_MenuAction("Functions"; "See Modulus Text"; 2; "")
	DB_MenuAction("Functions"; "See 4D write Text"; 3; "")
	DB_MenuAction("Functions"; "Preview"; 3; "")
	WR REDRAW:P12000:10(Write)
	
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Letters_inW.Variable3"; $_t_oldMethodName)
