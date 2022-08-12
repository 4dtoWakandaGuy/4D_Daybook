//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls ContrSrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/11/2010 20:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_Search; $Lay; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls ContrSrch")
//Calls Contract Search
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Menu_Record("Calls ContrSrch"; "Items by Contract")
$_t_Search:=Gen_Request("Contract Code to find:")
If ((OK=1) & ($_t_Search#""))
	QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=$_t_Search)
	If ([SERVICE_CALLS:20]Company_Code:1#"")
		QUERY SELECTION:C341([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1=[SERVICE_CALLS:20]Company_Code:1)
	End if 
	If (Records in selection:C76([CONTRACTS:17])>0)
		OK:=1
		If (Records in selection:C76([CONTRACTS:17])>1)
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[CONTRACTS:17])))
			
			
		End if 
		If ((OK=1) & (Records in selection:C76([CONTRACTS:17])>10))
			Gen_Confirm("Are you sure you want to load the Items from "+String:C10(Records in selection:C76([CONTRACTS:17]))+" Contracts?"; ""; "")
		End if 
		If (OK=1)
			FIRST RECORD:C50([CONTRACTS:17])
			If ([SERVICE_CALLS:20]Company_Code:1="")
				[SERVICE_CALLS:20]Company_Code:1:=[CONTRACTS:17]Company_Code:1
				[SERVICE_CALLS:20]Contact_Code:2:=[CONTRACTS:17]Contact_Code:2
			End if 
			Calls_dItems2
			GOTO OBJECT:C206([SERVICE_CALLS:20]Call_Date:5)
		End if 
	Else 
		Gen_Alert("Contract not found"; "")
	End if 
End if 
vNo:=Records in selection:C76([SERVICE_CALLS:20])
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Calls ContrSrch"; $_t_oldMethodName)