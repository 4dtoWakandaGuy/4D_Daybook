//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadTargetProjections
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(<>SP_ad_TargetProjectionDate;0)
	//ARRAY LONGINT(<>SP_al_TargetProjectionID;0)
	//ARRAY LONGINT(<>SP_al_TargetProjectionsLinkID;0)
	//ARRAY REAL(<>SP_ar_TargetProjectionAmount;0)
	C_LONGINT:C283($_l_Index; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadTargetProjections")
ARRAY LONGINT:C221(<>SP_al_TargetProjectionID; 0)
ARRAY DATE:C224(<>SP_ad_TargetProjectionDate; 0)
ARRAY REAL:C219(<>SP_ar_TargetProjectionAmount; 0)
ARRAY LONGINT:C221(<>SP_al_TargetProjectionsLinkID; 0)
If ($1>0)
	QUERY:C277([SALES_ProjectionLinks:114]; [SALES_ProjectionLinks:114]SalesProjectionParentID:3=$1)
	SELECTION TO ARRAY:C260([SALES_ProjectionLinks:114]SalesProjectionSubID:4; <>SP_al_TargetProjectionID; [SALES_ProjectionLinks:114]x_ID:1; <>SP_al_TargetProjectionsLinkID)
	ARRAY DATE:C224(<>SP_ad_TargetProjectionDate; Size of array:C274(<>SP_al_TargetProjectionID))
	ARRAY REAL:C219(<>SP_ar_TargetProjectionAmount; Size of array:C274(<>SP_al_TargetProjectionID))
	For ($_l_Index; 1; Size of array:C274(<>SP_al_TargetProjectionID))
		QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=<>SP_al_TargetProjectionID{$_l_Index})
		<>SP_ad_TargetProjectionDate{$_l_Index}:=[SALES_PROJECTION:113]Date_Entered:10
		<>SP_ar_TargetProjectionAmount{$_l_Index}:=[SALES_PROJECTION:113]GrossValue:13
	End for 
	
End if 
ERR_MethodTrackerReturn("SP_LoadTargetProjections"; $_t_oldMethodName)
