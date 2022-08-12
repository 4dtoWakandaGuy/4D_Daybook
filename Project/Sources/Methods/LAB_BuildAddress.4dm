//%attributes = {}
If (False:C215)
	//Project Method Name:      LAB_BuildAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentPosition)
	C_TEXT:C284(<>DB_t_addressFormatNotation; $_t_address; $_t_AddressFormatNotation; $_t_CurrentCharNUM; $_t_oldMethodName; $0; $1; $2; $3; $4; $5)
	C_TEXT:C284($6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LAB_BuildAddress")
If (Count parameters:C259>=6)
	//the 6th param is the country
	
	//Address_Details
	If (($6#"") & (DB_GetModuleSettingByNUM(1)#5))
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=$6)
		If (Records in selection:C76([COUNTRIES:73])>0)
			QUERY:C277([ADDRESS_FORMATS:74]; [ADDRESS_FORMATS:74]Format_Code:1=[COUNTRIES:73]Address_Format:2)
		Else 
			REDUCE SELECTION:C351([ADDRESS_FORMATS:74]; 0)
		End if 
		
		If ((Records in selection:C76([ADDRESS_FORMATS:74])=1) & ([ADDRESS_FORMATS:74]Address_Text:9#""))
			$_t_AddressFormatNotation:=[ADDRESS_FORMATS:74]Address_Text:9
		Else 
			$_t_AddressFormatNotation:=<>DB_t_addressFormatNotation
		End if 
	Else 
		$_t_AddressFormatNotation:=<>DB_t_addressFormatNotation
	End if 
	
	$0:=""
	$_t_address:=""
	
	$_l_CurrentPosition:=1
	While ($_l_CurrentPosition<=(Length:C16($_t_AddressFormatNotation)))
		IDLE:C311  // 7/04/03 pb
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
	End while 
	$0:=$_t_address
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("LAB_BuildAddress"; $_t_oldMethodName)