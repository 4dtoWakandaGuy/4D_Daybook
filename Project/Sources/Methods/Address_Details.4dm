//%attributes = {}
If (False:C215)
	//Project Method Name:      Address_Details
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
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($1)
	C_TEXT:C284(<>DB_t_addressFormatNotation; $_t_address; $_t_addressFormat; $_t_AddressFormatNotation; $_t_oldMethodName; vDetails)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Address_Details")
//Address_Details
If (([COMPANIES:2]Country:8#"") & ((DB_GetModuleSettingByNUM(1))#5))
	RELATE ONE:C42([COMPANIES:2]Country:8)
	RELATE ONE:C42([COUNTRIES:73]Address_Format:2)
	If ((Records in selection:C76([ADDRESS_FORMATS:74])=1) & ([ADDRESS_FORMATS:74]Address_Text:9#""))
		$_t_AddressFormatNotation:=[ADDRESS_FORMATS:74]Address_Text:9
	Else 
		$_t_AddressFormatNotation:=<>DB_t_addressFormatNotation
	End if 
Else 
	$_t_AddressFormatNotation:=<>DB_t_addressFormatNotation
End if 

vDetails:=""
If ([COMPANIES:2]Company_Name:2#"")
	vDetails:=[COMPANIES:2]Company_Name:2+Char:C90(13)
End if 
$_l_Index:=1
$_t_address:=""
While ($_l_Index<=(Length:C16($_t_AddressFormatNotation)))
	IDLE:C311  // 03/04/03 pb
	$_t_addressFormat:=Substring:C12($_t_AddressFormatNotation; $_l_Index; 1)
	Case of 
		: ($_t_addressFormat="1")
			$_t_address:=Address_DetailsConstruct([COMPANIES:2]Address_Line_one:3; $_t_AddressFormatNotation; $_t_address; ->$_l_Index)
		: ($_t_addressFormat="2")
			$_t_address:=Address_DetailsConstruct([COMPANIES:2]Address_Line_two:4; $_t_AddressFormatNotation; $_t_address; ->$_l_Index)
		: ($_t_addressFormat="3")
			$_t_address:=Address_DetailsConstruct([COMPANIES:2]Town_or_City:5; $_t_AddressFormatNotation; $_t_address; ->$_l_Index)
		: ($_t_addressFormat="4")
			$_t_address:=Address_DetailsConstruct([COMPANIES:2]County_or_State:6; $_t_AddressFormatNotation; $_t_address; ->$_l_Index)
		: ($_t_addressFormat="5")
			$_t_address:=Address_DetailsConstruct([COMPANIES:2]Postal_Code:7; $_t_AddressFormatNotation; $_t_address; ->$_l_Index)
		: ($_t_addressFormat="6")
			$_t_address:=Address_DetailsConstruct([COMPANIES:2]Country:8; $_t_AddressFormatNotation; $_t_address; ->$_l_Index)
		Else 
			$_t_address:=Address_DetailsConstruct(""; $_t_AddressFormatNotation; $_t_address; ->$_l_Index)
	End case 
End while 
//Below lines added 23./09/2008 NG
If (Count parameters:C259>=1)
	$1->:=vDetails+$_t_address
Else 
	vDetails:=vDetails+$_t_address
	
End if 
ERR_MethodTrackerReturn("Address_Details"; $_t_oldMethodName)
