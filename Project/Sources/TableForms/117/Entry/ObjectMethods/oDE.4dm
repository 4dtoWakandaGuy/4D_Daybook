If (False:C215)
	//object Name: [EW_ExportProjects]Entry.oDE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(EW_al_ExportRecordNumbers;0)
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.oDE"; Form event code:C388)
Case of 
	: (Form event code:C388=On Double Clicked:K2:5)  //Double-click
		//iLoc:=AL_GetLine (eALDataExports)
		iLoc:=Self:C308->
		EW_DisplayStep(EW_al_ExportRecordNumbers{iLoc})
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.oDE"; $_t_oldMethodName)
