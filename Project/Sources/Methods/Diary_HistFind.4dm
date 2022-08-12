//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_HistFind
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 21:14:45If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SD3_at_HistoryRelation;0)
	C_LONGINT:C283($0; $1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_HistFind")
//Diary_HistFind - converts menu items to reduced array
$0:=$1
If (Count parameters:C259=1)
	Case of 
		: ($1=4)
			$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Job")
			
		: ($1=6)
			$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Order")
			
		: ($1=8)
			$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Call")
		: ($1=9)
			$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Comp & Action")
		: ($1=10)
			$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Cont & Action")
		: ($1=11)
			$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Job & Action")
			
		: ($1=13)
			$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Order & Act")
			
		: ($1=15)
			$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Call & Action")
		: ($1=16)
			$0:=Find in array:C230(<>SD3_at_HistoryRelation; "Document")
	End case 
Else 
	Case of 
		: ($1=4)
			$0:=Find in array:C230($2->; "Job")
			
		: ($1=6)
			$0:=Find in array:C230($2->; "Order")
			
		: ($1=8)
			$0:=Find in array:C230($2->; "Call")
		: ($1=9)
			$0:=Find in array:C230($2->; "Comp & Action")
		: ($1=10)
			$0:=Find in array:C230($2->; "Cont & Action")
		: ($1=11)
			$0:=Find in array:C230($2->; "Job & Action")
			
		: ($1=13)
			$0:=Find in array:C230($2->; "Order & Act")
			
		: ($1=15)
			$0:=Find in array:C230($2->; "Call & Action")
		: ($1=16)
			$0:=Find in array:C230($2->; "Document")
	End case 
End if 
ERR_MethodTrackerReturn("Diary_HistFind"; $_t_oldMethodName)