//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp DetailsI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentPosition)
	C_TEXT:C284(<>DB_t_addressFormatNotation; $_t_Address; $_t_AddressFormatNotation; $_t_oldMethodName; $s; vDetails; vSalutation)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp DetailsI")
//Comp DetailsI
If (([COMPANIES:2]Invoice_Dept:24#"") & ([COMPANIES:2]Invoice_Name:25="") & ([COMPANIES:2]Invoice_Address_Line_One:18="") & ([COMPANIES:2]Invoice_Town:20="") & ([COMPANIES:2]Invoice_Postcode:22=""))
	Address_Details
	vDetails:=[COMPANIES:2]Invoice_Dept:24+Char:C90(13)+vDetails
Else 
	
	If ([COMPANIES:2]Invoice_Country:23#"")
		RELATE ONE:C42([COMPANIES:2]Invoice_Country:23)
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
	If ([COMPANIES:2]Invoice_Dept:24#"")
		vDetails:=[COMPANIES:2]Invoice_Dept:24+Char:C90(13)
	End if 
	If ([COMPANIES:2]Invoice_Name:25#"")
		vDetails:=vDetails+[COMPANIES:2]Invoice_Name:25+Char:C90(13)
	End if 
	$_l_CurrentPosition:=1
	While ($_l_CurrentPosition<=(Length:C16($_t_AddressFormatNotation)))
		IDLE:C311  // 03/04/03 pb
		$s:=Substring:C12($_t_AddressFormatNotation; $_l_CurrentPosition; 1)
		Case of 
			: ($s="1")
				$_t_Address:=Address_DetailsConstruct([COMPANIES:2]Invoice_Address_Line_One:18; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
			: ($s="2")
				$_t_Address:=Address_DetailsConstruct([COMPANIES:2]Invoice_Address_Line_Two:19; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
			: ($s="3")
				$_t_Address:=Address_DetailsConstruct([COMPANIES:2]Invoice_Town:20; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
			: ($s="4")
				$_t_Address:=Address_DetailsConstruct([COMPANIES:2]Invoice_County:21; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
			: ($s="5")
				$_t_Address:=Address_DetailsConstruct([COMPANIES:2]Invoice_Postcode:22; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
			: ($s="6")
				$_t_Address:=Address_DetailsConstruct([COMPANIES:2]Invoice_Country:23; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
			Else 
				$_t_Address:=Address_DetailsConstruct(""; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
		End case 
	End while 
	vSalutation:="Dear Sir/Madam"
	vDetails:=vDetails+$_t_Address
	
End if 
ERR_MethodTrackerReturn("Comp DetailsI"; $_t_oldMethodName)