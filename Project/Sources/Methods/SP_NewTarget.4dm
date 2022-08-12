//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_NewTarget
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_TargetProjectionID;0)
	//ARRAY REAL(SP_ar_TargetProjectionAmount;0)
	C_BOOLEAN:C305($_bo_NewProcess; $1; $2; SP_bo_SetupMultiple)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $_l_ParentProjectionID; $3; $4; SP_l_DefaultGroupID; SP_l_DefaultPersonID; SP_l_Save; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $5; SP_t_DefaultOwner)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_NewTarget")

$_bo_NewProcess:=False:C215
If (Count parameters:C259>=1)
	$_bo_NewProcess:=$1
End if 
If (Count parameters:C259>=2)
	SP_bo_SetupMultiple:=$2
Else 
	SP_bo_SetupMultiple:=False:C215
End if 
If (Count parameters:C259>=3)
	SP_l_DefaultPersonID:=$3
End if 
If (Count parameters:C259>=4)
	SP_l_DefaultGroupID:=$4
End if 
If (Count parameters:C259>=5)
	SP_t_DefaultOwner:=$5
End if 


//the SP_bo_SetupMultiple
//allows us to go straight to Page_2
If ($_bo_NewProcess)
	Start_Process
End if 
SP_l_Save:=0
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 4)
READ WRITE:C146([SALES_PROJECTION:113])
//error here needs testing
FORM SET INPUT:C55([SALES_PROJECTION:113]; "Target_EntryForm")
ADD RECORD:C56([SALES_PROJECTION:113]; *)
$_l_ParentProjectionID:=[SALES_PROJECTION:113]x_ID:1
If (SP_l_Save=1)
	For ($_l_Index; 1; Size of array:C274(SP_al_TargetProjectionID))
		If (SP_al_TargetProjectionID{$_l_Index}<0)
			READ WRITE:C146([SALES_PROJECTION:113])
			CREATE RECORD:C68([SALES_PROJECTION:113])
			[SALES_PROJECTION:113]Forcast_LevelID:3:=3
			[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
			[SALES_PROJECTION:113]GrossValue:13:=SP_ar_TargetProjectionAmount{$_l_Index}
			[SALES_PROJECTION:113]x_ID:1:=AA_GetNextIDinMethod(->[SALES_PROJECTION:113]x_ID:1)
			DB_SaveRecord(->[SALES_PROJECTION:113])
			AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
			CREATE RECORD:C68([SALES_ProjectionLinks:114])
			[SALES_ProjectionLinks:114]SalesProjectionSubID:4:=[SALES_PROJECTION:113]x_ID:1
			[SALES_ProjectionLinks:114]SalesProjectionParentID:3:=$_l_ParentProjectionID  //<-------
			[SALES_ProjectionLinks:114]x_ID:1:=AA_GetNextIDinMethod(->[SALES_ProjectionLinks:114]x_ID:1)
			DB_SaveRecord(->[SALES_ProjectionLinks:114])
			
			UNLOAD RECORD:C212([SALES_ProjectionLinks:114])
		End if 
	End for 
End if 

CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If ($_bo_NewProcess)
	Process_End
End if 
SP_l_Save:=0

SP_l_DefaultPersonID:=0
SP_l_DefaultGroupID:=0
SP_t_DefaultOwner:=""
SP_bo_SetupMultiple:=False:C215
ERR_MethodTrackerReturn("SP_NewTarget"; $_t_oldMethodName)