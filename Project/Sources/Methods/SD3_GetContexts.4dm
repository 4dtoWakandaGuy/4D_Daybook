//%attributes = {}

If (False:C215)
	//Database Method Name:      SD3_GetContexts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/12/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_contIncludeDocs;0;0)
	//ARRAY LONGINT(SD2_AL_FormIDs;0)
	//ARRAY LONGINT(SD2_AL_TABCONTEXT;0)
	//ARRAY LONGINT(SD2_AL_TABIDS;0)
	//ARRAY TEXT(SD2_at_ContTABNAMES;0)
	C_BOOLEAN:C305(SD3_bo_ContextsInited)
	C_POINTER:C301($1; $2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_GetContexts")
If (Count parameters:C259>=5)
	If (Not:C34(SD3_bo_ContextsInited))
		ARRAY LONGINT:C221(SD2_AL_TABCONTEXT; 0)
		ARRAY TEXT:C222(SD2_at_ContTABNAMES; 0; 0)
		ARRAY LONGINT:C221(SD2_al_contIncludeDocs; 0; 0)
		ARRAY LONGINT:C221(SD2_AL_TABIDS; 0)
		ARRAY LONGINT:C221(SD2_AL_FormIDs; 0; 0)
		SD3_bo_ContextsInited:=True:C214
	End if 
	$1->:=->SD2_AL_TABCONTEXT
	$2->:=->SD2_at_ContTABNAMES  //2D array
	$3->:=->SD2_al_contIncludeDocs  //2D array
	$4->:=->SD2_AL_TABIDS
	$5->:=->SD2_AL_FormIDs  //2D array
End if 
ERR_MethodTrackerReturn("SD3_GetContexts"; $_t_oldMethodName)
