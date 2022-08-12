//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ModeSimple
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
	ARRAY LONGINT:C221($_al_Lines; 0)
	//ARRAY TEXT(<>LB_at_EditModes;0)
	C_LONGINT:C283(<>ALselectinEntryMode; <>vALMode; $_l_FirstLine; LB_l_RowNumber)
	C_PICTURE:C286(<>LB_pic_ModePicture)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ModeSimple")

//NG 19/7/2006 this method is a replacement for ALmodeSimple
//NG CALLS TO THIS METHOD NEED TO PASS THE COLUMN(Array)-a pointer to in $2(if mode=2, 0 if mode=1) and the Current selected row
//this is not called at all

$_t_oldMethodName:=ERR_MethodTracker("LBi_ModeSimple")
//ALModeSimple - see also ALEditListLay
If (<>LB_at_EditModes=0)
	If (<>vALMode=1)
		<>LB_at_EditModes:=2
	Else 
		<>LB_at_EditModes:=1
	End if 
End if 

Case of 
	: (<>LB_at_EditModes=1)
		//AL_GetPrevCell ($1->;bd36;bd37)
		//AL_SetEntryOpts ($1->;4;0;0;0;0)
		If (LB_l_RowNumber=0)
			LB_l_RowNumber:=1
		End if 
		LBi_SetSelect1($1; LB_l_RowNumber)
		OK:=0
		<>vALMode:=1
		//GET PICTURE FROM LIBRARY(20261; <>LB_pic_ModePicture)
		<>LB_pic_ModePicture:=Get_Picture(20261)
		
	: (<>LB_at_EditModes=2)
		ARRAY LONGINT:C221($_al_Lines; 0)
		//$i:=AL_GetSelect ($1->;$_al_Lines)
		LB_GetSelect($1; ->$_al_Lines)
		
		If (Size of array:C274($_al_Lines)>0)
			$_l_FirstLine:=$_al_Lines{1}
		Else 
			$_l_FirstLine:=1
		End if 
		
		
		If (<>ALselectinEntryMode=1)
			//AL_SetEntryOpts ($1->;3;0;0;0;1)
		Else 
			//AL_SetEntryOpts ($1->;2;0;0;0;1)
		End if 
		GOTO OBJECT:C206($1->)
		
		EDIT ITEM:C870($2->; $_l_FirstLine)
		
		OK:=0
		<>vALMode:=2
		//GET PICTURE FROM LIBRARY(20260; <>LB_pic_ModePicture)
		<>LB_pic_ModePicture:=Get_Picture(20260)
		
End case 
ERR_MethodTrackerReturn("LBi_ModeSimple"; $_t_oldMethodName)
