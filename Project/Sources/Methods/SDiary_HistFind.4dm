//%attributes = {}
If (False:C215)
	//Project Method Name:      SDiary_HistFind
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(<>SD3_at_HistoryRelation;0)
	C_LONGINT:C283($0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SDiary_HistFind")
//SDiary_HistFind - WT-13/08/01 - converts pop-up menu items to reduced array

$0:=$1
Case of 
	: ($1=12)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Company")
	: ($1=13)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Contact")
	: ($1=14)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Job")
		
	: ($1=16)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Order")
	: ($1=18)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Call")
	: ($1=19)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Comp & Action")
	: ($1=20)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Cont & Action")
		
	: ($1=23)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Order & Act")
		
	: ($1=25)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Call & Action")
	: ($1=26)
		$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Document")
End case 
ERR_MethodTrackerReturn("SDiary_HistFind"; $_t_oldMethodName)