If (False:C215)
	//object Name: Object Name:      PRT_DymoLabelProject.oAddObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/05/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRT_lb_ListboxPrintObjects;0)
	//ARRAY LONGINT(Prt_al_labelobjectFontsize;0)
	//ARRAY TEXT(Prt_at_LabelObjectFont;0)
	//ARRAY TEXT(Prt_at_labelobjectFontStyle;0)
	//ARRAY TEXT(Prt_at_labelobjectFrameOption;0)
	//ARRAY TEXT(PRT_At_LabelObjects;0)
	//ARRAY TEXT(PRT_at_LabelObjectType;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PRT_DymoLabelProject.oAddObject"; Form event code:C388)

LISTBOX INSERT ROWS:C913(PRT_lb_ListboxPrintObjects; Size of array:C274(PRT_At_LabelObjects))
PRT_at_LabelObjectType{Size of array:C274(PRT_at_LabelObjectType)}:="Text"
Prt_at_LabelObjectFont{Size of array:C274(Prt_at_LabelObjectFont)}:="Times"
Prt_al_labelobjectFontsize{Size of array:C274(Prt_al_labelobjectFontsize)}:=12
Prt_at_labelobjectFontStyle{Size of array:C274(Prt_at_labelobjectFontStyle)}:="Normal"
Prt_at_labelobjectFrameOption{Size of array:C274(Prt_at_labelobjectFrameOption)}:="No Frame"
ERR_MethodTrackerReturn("OBJ PRT_DymoLabelProject.oAddObject"; $_t_oldMethodName)