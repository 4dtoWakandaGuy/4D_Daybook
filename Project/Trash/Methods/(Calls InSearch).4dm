//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls_InSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/06/2010 22:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_SCCodes; 0)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_SCCode; $_t_SCDescription; vProbCode; vProdCode; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_InSearch")
//Calls_InSearch
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Menu_Record("Calls_InSearch"; "Find Possible Solutions")
vProdCode:=[SERVICE_CALLS_PRODUCTS:152]Product_Code:1
vProbCode:=[SERVICE_CALLS:20]Problem_Code:14
If ((vProdCode="") | (vProbCode=""))
	Gen_Alert("Please first specify both a Product and a Problem"; "Cancel")
Else 
	If ([SERVICE_CALLS:20]Call_Code:4="")
		Calls_Code
	End if 
	If (Modified record:C314([SERVICE_CALLS:20]))
		DB_SaveRecord(->[SERVICE_CALLS:20])
	End if 
	COPY NAMED SELECTION:C331([SERVICE_CALLS:20]; "Calls")
	FIRST RECORD:C50([SERVICE_CALLS:20])
	If (Modified record:C314([ORDER_ITEMS:25]))
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		
	End if 
	ONE RECORD SELECT:C189([SERVICE_CALLS:20])
	CREATE SET:C116([SERVICE_CALLS:20]; "Extra")
	
	QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Problem_Code:14=vProbCode; *)
	QUERY:C277([SERVICE_CALLS:20];  & ; [SERVICE_CALLS:20]Solution_Code:16#"")
	CREATE SET:C116([SERVICE_CALLS:20]; "$Set1")
	
	QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Product_Code:1=vProdCode)
	SELECTION TO ARRAY:C260([SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8; $_at_SCCodes)
	QUERY WITH ARRAY:C644([SERVICE_CALLS:20]Call_Code:4; $_at_SCCodes)
	CREATE SET:C116([SERVICE_CALLS:20]; "$Set2")
	INTERSECTION:C121("$Set1"; "$set2"; "$Set1")
	USE SET:C118("$set1")
	CREATE SET:C116([SERVICE_CALLS:20]; "Extra2")
	DIFFERENCE:C122("Extra2"; "Extra"; "Extra2")
	USE SET:C118("Extra2")
	
	$_t_SCCode:=""
	$_t_SCDescription:=""
	If (Records in selection:C76([SERVICE_CALLS:20])>0)
		DBI_MenuSelectRecords(Table name:C256(Table:C252(->[SERVICE_CALLS:20])); True:C214)
		If (Records in selection:C76([SERVICE_CALLS:20])>0)
			$_t_SCCode:=[SERVICE_CALLS:20]Solution_Code:16
			$_t_SCDescription:=[SERVICE_CALLS:20]Solution_Description:17
		End if 
		
	Else 
		Gen_Alert("No previous Solutions found"; "")
	End if 
	
	USE NAMED SELECTION:C332("Calls")
	CLEAR NAMED SELECTION:C333("Calls")
	vNo:=Records in selection:C76([SERVICE_CALLS:20])
	If (($_t_SCCode#"") & ([SERVICE_CALLS:20]Solution_Code:16=""))
		[SERVICE_CALLS:20]Solution_Code:16:=$_t_SCCode
		[SERVICE_CALLS:20]Solution_Description:17:="COPIED: "+$_t_SCDescription
		Calls_InLPSol
	End if 
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	Calls_InLPB
End if 
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
vNo:=Records in selection:C76([SERVICE_CALLS:20])
ERR_MethodTrackerReturn("Calls_InSearch"; $_t_oldMethodName)