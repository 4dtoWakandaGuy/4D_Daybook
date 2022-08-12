//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_BUILDADDRESS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/04/2011 13:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentPosition; $_l_ModuleRef)
	C_TEXT:C284(<>DB_t_addressFormatNotation; <>SYS_t_DefaultTelFormat; $_t_address; $_t_AddressCountry; $_t_AddressCounty; $_t_AddressFormatNotation; $_t_AddressLine1; $_t_AddressLine2; $_t_AddressLine3; $_t_AddressLine4; $_t_AddressPostCode)
	C_TEXT:C284($_t_AddressTown; $_t_CurrentCharNUM; $_t_CurrentFieldReferencetext; $_t_FormatedAddress; $_t_oldMethodName; $_t_SHortState; $0; $1; $2; $3; $4)
	C_TEXT:C284($5; $6; COM_t_TelephoneNumberFormat)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_BUILDADDRESS")
//Based onAddress_Details
//but does not return the company name
$_l_ModuleRef:=5
$_t_address:=""
$_l_ModuleRef:=1  //NG November 2004
If (Count parameters:C259<6)
	If (([COMPANIES:2]Country:8#"") & ($_l_ModuleRef#5))
		RELATE ONE:C42([COMPANIES:2]Country:8)
		RELATE ONE:C42([COUNTRIES:73]Address_Format:2)
		If ((Records in selection:C76([ADDRESS_FORMATS:74])=1) & ([ADDRESS_FORMATS:74]Address_Text:9#""))
			$_t_AddressFormatNotation:=[ADDRESS_FORMATS:74]Address_Text:9
		Else 
			$_t_AddressFormatNotation:=<>DB_t_addressFormatNotation
		End if 
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	Else 
		$_t_AddressFormatNotation:=<>DB_t_addressFormatNotation
		
		COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
		
	End if 
	$_t_address:=""
	$_l_CurrentPosition:=1
	$_t_FormatedAddress:=""
	While ($_l_CurrentPosition<=(Length:C16($_t_AddressFormatNotation)))
		If (False:C215)
			$_t_CurrentCharNUM:=Substring:C12($_t_AddressFormatNotation; $_l_CurrentPosition; 1)
			Case of 
				: ($_t_CurrentCharNUM="1")
					$_t_address:=Address_DetailsConstruct([COMPANIES:2]Address_Line_one:3; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="2")
					$_t_address:=Address_DetailsConstruct([COMPANIES:2]Address_Line_two:4; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="3")
					$_t_address:=Address_DetailsConstruct([COMPANIES:2]Town_or_City:5; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="4")
					$_t_address:=Address_DetailsConstruct([COMPANIES:2]County_or_State:6; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="5")
					$_t_address:=Address_DetailsConstruct([COMPANIES:2]Postal_Code:7; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="6")
					$_t_address:=Address_DetailsConstruct([COMPANIES:2]Country:8; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				Else 
					$_t_address:=Address_DetailsConstruct(""; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
			End case 
			$_l_CurrentPosition:=$_l_CurrentPosition+1
		End if 
		$_t_CurrentFieldReferencetext:=Substring:C12($_t_AddressFormatNotation; $_l_CurrentPosition; 1)
		Case of 
			: ($_t_CurrentFieldReferencetext="1")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Address_Line_one:3; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="2")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Address_Line_two:4; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="3")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Town_or_City:5; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="4_")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]County_or_State:6; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="5__")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Postal_Code:7; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="4")
				$_t_AddressCounty:=[COMPANIES:2]County_or_State:6
				Case of 
					: ($_t_AddressCountry="USA")
						$_t_SHortState:=UTIL_GetUSState($_t_AddressCounty)
						
						If ($_t_SHortState#"")
							$_t_AddressCounty:=$_t_SHortState
						End if 
					: ($_t_AddressCountry="AUSTRALIA")
						Case of 
							: ($_t_AddressCounty="Victoria")
								$_t_AddressCounty:="VIC"
							: ($_t_AddressCounty="New South Wales")
								$_t_AddressCounty:="NSW"
							: ($_t_AddressCounty="Queensland")
								$_t_AddressCounty:="QLD"
							: ($_t_AddressCounty="South Australia")
								$_t_AddressCounty:="SA"
							: ($_t_AddressCounty="Western Australia")
								$_t_AddressCounty:="WA"
							: ($_t_AddressCounty="Australian Capital Territory")
								$_t_AddressCounty:="ACT"
							: ($_t_AddressCounty="Northern Territory")
								$_t_AddressCounty:="NT"
							: ($_t_AddressCounty="Tasmania")
								$_t_AddressCounty:="TAS"
						End case 
				End case 
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; $_t_AddressCounty; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="5")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Postal_Code:7; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="6")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Country:8; $_t_AddressFormatNotation; $_l_CurrentPosition)
			Else 
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; ""; $_t_AddressFormatNotation; $_l_CurrentPosition)
				
				
		End case 
		
		
	End while 
	$0:=$_t_FormatedAddress
Else 
	
	If (($6#"") & ($_l_ModuleRef#5))
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=$6)
		RELATE ONE:C42([COUNTRIES:73]Address_Format:2)
		If ((Records in selection:C76([ADDRESS_FORMATS:74])=1) & ([ADDRESS_FORMATS:74]Address_Text:9#""))
			$_t_AddressFormatNotation:=[ADDRESS_FORMATS:74]Address_Text:9
		Else 
			$_t_AddressFormatNotation:=<>DB_t_addressFormatNotation
		End if 
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	Else 
		$_t_AddressFormatNotation:=<>DB_t_addressFormatNotation
		COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
	End if 
	$_t_address:=""
	$_l_CurrentPosition:=1
	
	While ($_l_CurrentPosition<=(Length:C16($_t_AddressFormatNotation)))
		If (False:C215)
			$_t_CurrentCharNUM:=Substring:C12($_t_AddressFormatNotation; $_l_CurrentPosition; 1)
			Case of 
				: ($_t_CurrentCharNUM="1")
					$_t_address:=Address_DetailsConstruct($1; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="2")
					$_t_address:=Address_DetailsConstruct($2; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="3")
					$_t_address:=Address_DetailsConstruct($3; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="4")
					$_t_address:=Address_DetailsConstruct($4; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="5")
					$_t_address:=Address_DetailsConstruct($5; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				: ($_t_CurrentCharNUM="6")
					$_t_address:=Address_DetailsConstruct($6; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
				Else 
					$_t_address:=Address_DetailsConstruct(""; $_t_AddressFormatNotation; $_t_address; ->$_l_CurrentPosition)
			End case 
		End if 
		$_t_CurrentFieldReferencetext:=Substring:C12($_t_AddressFormatNotation; $_l_CurrentPosition; 1)
		Case of 
			: ($_t_CurrentFieldReferencetext="1")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Address_Line_one:3; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="2")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Address_Line_two:4; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="3")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Town_or_City:5; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="4_")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]County_or_State:6; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="5__")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Postal_Code:7; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="4")
				$_t_AddressCounty:=[COMPANIES:2]County_or_State:6
				Case of 
					: ($_t_AddressCountry="USA")
						$_t_SHortState:=UTIL_GetUSState($_t_AddressCounty)
						If ($_t_SHortState#"")
							$_t_AddressCounty:=$_t_SHortState
						End if 
					: ($_t_AddressCountry="AUSTRALIA")
						Case of 
							: ($_t_AddressCounty="Victoria")
								$_t_AddressCounty:="VIC"
							: ($_t_AddressCounty="New South Wales")
								$_t_AddressCounty:="NSW"
							: ($_t_AddressCounty="Queensland")
								$_t_AddressCounty:="QLD"
							: ($_t_AddressCounty="South Australia")
								$_t_AddressCounty:="SA"
							: ($_t_AddressCounty="Western Australia")
								$_t_AddressCounty:="WA"
							: ($_t_AddressCounty="Australian Capital Territory")
								$_t_AddressCounty:="ACT"
							: ($_t_AddressCounty="Northern Territory")
								$_t_AddressCounty:="NT"
							: ($_t_AddressCounty="Tasmania")
								$_t_AddressCounty:="TAS"
						End case 
				End case 
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; $_t_AddressCounty; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="5")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Postal_Code:7; $_t_AddressFormatNotation; $_l_CurrentPosition)
			: ($_t_CurrentFieldReferencetext="6")
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; [COMPANIES:2]Country:8; $_t_AddressFormatNotation; $_l_CurrentPosition)
			Else 
				$_l_CurrentPosition:=UTIL_AddToAddress(->$_t_FormatedAddress; ""; $_t_AddressFormatNotation; $_l_CurrentPosition)
				
				
		End case 
		
		
	End while 
	$0:=$_t_FormatedAddress
	
End if 
ERR_MethodTrackerReturn("WS_BUILDADDRESS"; $_t_oldMethodName)
