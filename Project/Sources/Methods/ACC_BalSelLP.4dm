//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalSelLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_menuItem; $_l_Mode; $0; $1; $2; $3; vAB; vTButt)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalSelLP")
$0:=0
If (Count parameters:C259=0)
	$_l_menuItem:=Sel_LPmi("Acc_BalSelLP")
Else 
	If ($1>0)
		$_l_menuItem:=$1
	Else 
		$_l_menuItem:=Sel_LPmi("Acc_BalSelLP")
	End if 
	
End if 
If (Count parameters:C259>=2)
	$_l_Mode:=$2
End if 

If (Count parameters:C259<=1)
	$0:=0
	If ($_l_menuItem>0)
		Case of 
			: ($_l_menuItem=1)
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[ACCOUNTS:32]; ->OK; ->vAB; "Search"; "Many"; ""; ""; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNT_BALANCES:34]Account_Code:2)
			: ($_l_menuItem=2)
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PERIODS:33]; ->OK; ->vAB; "Search"; "Many"; ""; ""; ->[PERIODS:33]Period_Code:1; ->[ACCOUNT_BALANCES:34]Period_Code:4)
		End case 
	End if 
Else 
	//More than one paramter Auto search
	//$2=Table number at which to drop out
	//$3=mode(1 for create 2 for edit)
	//$4= pointer to array containing the queries to run
	//$5=Pointer to array in which to return query ids
	$0:=0
	If ($_l_menuItem>0)
		Case of 
			: ($_l_menuItem=1)
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[ACCOUNTS:32]; ->OK; ->vAB; "Search"; "Many"; ""; ""; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNT_BALANCES:34]Account_Code:2; $2; $3; $4; $5)
			: ($_l_menuItem=2)
				$0:=Sel_CrossTable(0; 0; 0; "TMaster"; "TBig"; ->vTButt; ->[PERIODS:33]; ->OK; ->vAB; "Search"; "Many"; ""; ""; ->[PERIODS:33]Period_Code:1; ->[ACCOUNT_BALANCES:34]Period_Code:4; $2; $3; $4; $5)
		End case 
	End if 
	
End if 
ERR_MethodTrackerReturn("Acc_BalSelLP"; $_t_oldMethodName)
