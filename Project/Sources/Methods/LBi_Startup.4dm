//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_Startup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>DB_at_LBViews;0;0)
	//ARRAY TEXT(<>FUR_at_2dCustomFieldFormat;0;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0;0)
	//ARRAY TEXT(<>LB_at_EditModes;0)
	//ARRAY TEXT(<>LB_at_ListboxEditMode;0)
	C_LONGINT:C283(<>vALMode; $_l_LastTableNumber)
	C_PICTURE:C286(<>LB_pic_ModePicture)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_Startup")

//THis method is a direct replacement for ALstartup
$_t_oldMethodName:=ERR_MethodTracker("LBi_Startup")

//ALStartup
//Arrays for AL List Layouts definitions

If ((DB_GetModuleSettingByNUM(1))#5)  //(◊DefListLay)
	ARRAY TEXT:C222(<>LB_at_EditModes; 3)
	<>LB_at_EditModes{3}:="Definitions"
Else 
	ARRAY TEXT:C222(<>LB_at_EditModes; 2)
End if 
<>LB_at_EditModes{1}:="Selectable"
<>LB_at_EditModes{2}:="Editable"
<>LB_at_EditModes:=1
<>vALMode:=1
ARRAY TEXT:C222(<>LB_at_ListboxEditMode; 2)
<>LB_at_ListboxEditMode{1}:="Selectable"
<>LB_at_ListboxEditMode{2}:="Editable"
<>LB_at_ListboxEditMode:=1
//GET PICTURE FROM LIBRARY(20261; <>LB_pic_ModePicture)
<>LB_pic_ModePicture:=Get_Picture(20261)
While (Semaphore:C143("$Inserting"+"ALREFS"))
	DelayTicks
End while 

//ARRAY STRING(5;◊aALRefs;0)
//ARRAY STRING(7;◊aALRef2;0)
//ARRAY POINTER(◊aALpFldP;0;0)
//ARRAY STRING(15;◊aALpForm;0;0)
//ARRAY STRING(79;◊aALpFmul;0;0)
//ARRAY INTEGER(◊aALaType;0;0)
//ARRAY STRING(55;◊aALpTitl;0;0)
//ARRAY INTEGER(◊aALpWidt;0;0)
//ARRAY BOOLEAN(◊aALpEnte;0;0)
//ARRAY BOOLEAN(◊aALpLock;0;0)
//ARRAY INTEGER(◊aALpFont;0;0)
//ARRAY STRING(7;◊aALpColo;0;0)
//ARRAY INTEGER(◊aALpFoot;0;0)

$_l_LastTableNumber:=Get last table number:C254

ARRAY TEXT:C222(<>DB_at_LBViews; 0; 0)

CLEAR SEMAPHORE:C144("$Inserting"+"ALREFS")
//See also FurthFldD_Mod & Personnel_Mod & FurthFld_Func2
//one row for each table
ARRAY TEXT:C222(<>FUR_at_CustomFieldNames; $_l_LastTableNumber; 0)
ARRAY TEXT:C222(<>FUR_at_2dCustomFieldFormat; $_l_LastTableNumber; 0)  //NG November 2004
ARRAY TEXT:C222(<>FUR_at_CustomFieldTypes; $_l_LastTableNumber; 0)
ERR_MethodTrackerReturn("LBi_Startup"; $_t_oldMethodName)
