//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Form SROK
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OptionKey; $0)
	C_LONGINT:C283(<>FormMethod; $Doc)
	C_TEXT:C284(<>SYS_t_FormPath; $_t_oldMethodName; $1)
	C_TIME:C306(vDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Form SROK")
If (Is macOS:C1572)
	
	$_bo_OptionKey:=Gen_Option
	$0:=((((<>FormMethod=1) & ($_bo_OptionKey=False:C215)) | (($_bo_OptionKey) & (<>FormMethod=0))) & ($1#"") & (($1="Invoice") | ($1="Invoice DT") | ($1="Purchase Order") | ($1="Movement Form") | ($1="Order Ack") | ($1="Order Quote") | ($1="Order Auth") | ($1="Delivery Note") | ($1="Contract Form") | ($1="Remittance")))
	If ($0)
		
		ON ERR CALL:C155("")
		OK:=1
		ON ERR CALL:C155("Remote_Err")
		vDoc:=DB_OpenDocument(<>SYS_t_FormPath+$1)
		ON ERR CALL:C155("")
		If (OK=1)
			$0:=True:C214
			Close_DocUMENT(vDoc)
		Else 
			$0:=False:C215
		End if 
		ON ERR CALL:C155("")
	End if 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Form SROK"; $_t_oldMethodName)