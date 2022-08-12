//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_FFS2
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
	//Array TEXT(aSV1;0)
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_FFS2")

Case of 
	: ($1="@A")
		QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]String_31:4=aSV1{$2})
	: ($1="@N")
		QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Real_or_Integer:5=Num:C11(aSV1{$2}))
	: ($1="@D")
		QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Date_Field:7=Date:C102(aSV1{$2}))
End case 
ERR_MethodTrackerReturn("StatsView_FFS2"; $_t_oldMethodName)