//%attributes = {}

If (False:C215)
	//Database Method Name:      UTIL_SmartConstructAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ADR_al_Timings;0)
	//ARRAY TEXT(ADR_at_TimingPoints;0)
	C_POINTER:C301($_Ptr_Address1; $_Ptr_address2; $_Ptr_Address3; $_Ptr_Address4; $_Ptr_Country; $_Ptr_County; $_Ptr_Postcode; $_Ptr_Town; $10; $11; $12)
	C_POINTER:C301($13; $14; $15; $16; $9)
	C_TEXT:C284($_t_address1; $_t_address2; $_t_address3; $_t_address4; $_t_afterBreak; $_t_BeforeBreak; $_t_Country; $_t_County; $_t_MethodName; $_t_Postcode; $_t_Town)
	C_TEXT:C284($1; $2; $3; $4; $5; $6; $7; $8)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("UTIL_SmartConstructAddress")
If (UTIL_isComponentInstalled("AddressComponent"))
	If (Count parameters:C259>=16)
		$_t_address1:=""
		$_t_address2:=""
		$_t_address3:=""
		$_t_address4:=""
		$_t_Town:=""
		$_t_County:=""
		$_t_Country:=""
		$_t_Postcode:=""
		$_Ptr_Address1:=$9
		$_Ptr_address2:=$10
		$_Ptr_Address3:=$11
		$_Ptr_Address4:=$12
		$_Ptr_Town:=$13
		$_Ptr_County:=$14
		
		$_Ptr_Country:=$15
		$_Ptr_Postcode:=$16
		
		
		ARRAY TEXT:C222(ADR_at_TimingPoints; 0)
		ARRAY LONGINT:C221(ADR_al_Timings; 0)
		$_t_MethodName:="ADR_ConstructAddress"
		EXECUTE METHOD:C1007($_t_MethodName; *; $1; $2; $3; $4; $5; $6; $7; $8; ->$_t_address1; ->$_t_address2; ->$_t_address3; ->$_t_address4; ->$_t_Town; ->$_t_County; ->$_t_Country; ->$_t_Postcode; False:C215; ->ADR_al_Timings; ->ADR_at_TimingPoints)
		$_Ptr_Address1->:=$_t_Address1
		$_Ptr_address2->:=$_t_Address2
		$_Ptr_Address3->:=$_t_Address3
		$_Ptr_Address4->:=$_t_Address4
		$_Ptr_Town->:=$_t_Town
		$_Ptr_County->:=$_t_County
		$_Ptr_Country->:=$_t_Country
		$_Ptr_Postcode->:=$_t_POstcode
		
	End if 
End if 
ERR_MethodTrackerReturn("UTIL_SmartConstructAddress"; $_t_oldMethodName)