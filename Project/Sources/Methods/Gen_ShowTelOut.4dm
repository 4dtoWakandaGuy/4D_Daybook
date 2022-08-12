//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ShowTelOut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ShowTelOut")
COPY NAMED SELECTION:C331($1->; "Selection")
If (Records in set:C195("Userset")>0)
	USE SET:C118("Userset")
End if 
FIRST RECORD:C50($1->)
If (Table:C252($1)#2)  //& (File($1)#1))
	RELATE ONE:C42($1->)
Else 
	If (Table:C252($1)=2)
		DB_t_CurrentFormUsage2:="Comp"
	End if 
End if 
If (Table:C252($2)#1)
	RELATE ONE:C42($2->)
End if 
Gen_ShowTel
USE NAMED SELECTION:C332("Selection")
CLEAR NAMED SELECTION:C333("Selection")
If (DB_t_CurrentFormUsage2="Comp")
	DB_t_CurrentFormUsage2:=""
End if 
ERR_MethodTrackerReturn("Gen_ShowTelOut"; $_t_oldMethodName)