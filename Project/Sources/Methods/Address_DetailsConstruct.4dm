//%attributes = {}
If (False:C215)
	//Project Method Name:      Address_DetailsConstruct
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
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($4)
	C_TEXT:C284($_t_addressLine; $_t_AddressText; $_t_oldMethodName; $0; $1; $2; $3; vDetails; vDetails_Text)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Address_DetailsConstruct")
$_t_addressLine:=$1
$0:=""
$_bo_OK:=False:C215
$_t_addressLine:=Replace string:C233($_t_addressLine; Char:C90(13); " ")
$_t_addressLine:=Replace string:C233($_t_addressLine; Char:C90(10); " ")

$_t_addressLine:=Replace string:C233($_t_addressLine; Char:C90(9); " ")
$_t_addressLine:=Replace string:C233($_t_addressLine; "  "; " ")  //Double spaces
Repeat 
	If ($_t_addressLine#"")
		If ($_t_addressLine[[Length:C16($_t_addressLine)]]=" ")
			$_t_addressLine:=Substring:C12($_t_addressLine; 1; Length:C16($_t_addressLine)-1)
		Else 
			
			
			$_bo_OK:=True:C214
			
		End if 
	End if 
Until ($_t_addressLine="") | ($_bo_OK)
If (Count parameters:C259>=3)
	//NG August 2004 modifying this method. Frequently people seem to enter ' ' in the address fields(a space instead of blank.
	//this makes the built address look wrong. So we are going to ignore spaces at the end of the fields.
	
	
	
	If ($_t_addressLine#"")
		$0:=$3+$_t_addressLine
	Else 
		$0:=$3
		
	End if 
	If (Count parameters:C259>=4)
		$_l_Index:=$4->
	End if 
	
	$_l_Index:=$_l_Index+1
	$_t_AddressText:=Substring:C12($2; $_l_Index; 1)
	While (($_t_AddressText#"1") & ($_t_AddressText#"2") & ($_t_AddressText#"3") & ($_t_AddressText#"4") & ($_t_AddressText#"5") & ($_t_AddressText#"6") & ($_l_Index<=(Length:C16($2))))
		IDLE:C311  // 03/04/03 pb
		If ($_t_addressLine#"")
			$0:=$0+$_t_AddressText
		End if 
		$_l_Index:=$_l_Index+1
		$_t_AddressText:=Substring:C12($2; $_l_Index; 1)
	End while 
	If (Count parameters:C259>=4)
		$4->:=$_l_Index
	End if 
	
Else 
	If ($_t_addressLine#"")
		vDetails:=vDetails+$_t_addressLine
		// vDetails2:=vDetails+$_t_addressLine
		vDetails_Text:=vDetails+$_t_addressLine+Char:C90(9)  //WT - 10/11:need to fix for text merge in 4D Write
	End if 
	$_l_Index:=$_l_Index+1
	$_t_AddressText:=Substring:C12($2; $_l_Index; 1)
	While (($_t_AddressText#"1") & ($_t_AddressText#"2") & ($_t_AddressText#"3") & ($_t_AddressText#"4") & ($_t_AddressText#"5") & ($_t_AddressText#"6") & ($_l_Index<=(Length:C16($2))))
		IDLE:C311  // 03/04/03 pb
		If ($_t_addressLine#"")
			vDetails:=vDetails+$_t_AddressText
			//vDetails2:=vDetails+$_t_AddressText
		End if 
		$_l_Index:=$_l_Index+1
		$_t_AddressText:=Substring:C12($2; $_l_Index; 1)
	End while 
End if 
ERR_MethodTrackerReturn("Address_DetailsConstruct"; $_t_oldMethodName)
