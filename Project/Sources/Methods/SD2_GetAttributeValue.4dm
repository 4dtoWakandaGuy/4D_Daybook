//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_GetAttributeValue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AttributeTypes; 0)
	ARRAY TEXT:C222($_at_AttributeNames; 0)
	C_LONGINT:C283($_l_Reference; $_l_Type)
	C_POINTER:C301($_ptr_attributes; $_Ptr_ReturnValue; $1; $3)
	C_TEXT:C284($_t_attributeName; $2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD2_GetAttributeValue")
$_ptr_attributes:=$1
$_t_attributeName:=$2
$_Ptr_ReturnValue:=$3
//note that $3 could be an array or a number or a date etc
$_l_Type:=Type:C295($_Ptr_ReturnValue->)
OB GET PROPERTY NAMES:C1232([ACTIONS:13]AttributesObject:42; $_at_AttributeNames; $_al_AttributeTypes)
$_l_Reference:=Find in array:C230($_at_AttributeNames; $_t_attributeName)
If ($_l_Reference>0)
	Case of 
		: ($_l_Type=Is text:K8:3) & ($_al_AttributeTypes{$_l_Reference}=Is text:K8:3)
			$_Ptr_ReturnValue->:=OB Get:C1224($_ptr_attributes->; $_t_attributeName)
		: ($_l_Type=Is longint:K8:6) & ($_al_AttributeTypes{$_l_Reference}=Is longint:K8:6)
			$_Ptr_ReturnValue->:=OB Get:C1224($_ptr_attributes->; $_t_attributeName)
		: ($_l_Type=Is real:K8:4) & ($_al_AttributeTypes{$_l_Reference}=Is real:K8:4)
			$_Ptr_ReturnValue->:=OB Get:C1224($_ptr_attributes->; $_t_attributeName)
		: ($_l_Type=Is integer:K8:5) & ($_al_AttributeTypes{$_l_Reference}=Is integer:K8:5)
			$_Ptr_ReturnValue->:=OB Get:C1224($_ptr_attributes->; $_t_attributeName)
		: ($_l_Type=Is date:K8:7) & ($_al_AttributeTypes{$_l_Reference}=Is date:K8:7)
			$_Ptr_ReturnValue->:=OB Get:C1224($_ptr_attributes->; $_t_attributeName)
		: ($_l_Type=Is time:K8:8) & ($_al_AttributeTypes{$_l_Reference}=Is time:K8:8)
			$_Ptr_ReturnValue->:=OB Get:C1224($_ptr_attributes->; $_t_attributeName)
		: ($_l_Type=Is boolean:K8:9) & ($_al_AttributeTypes{$_l_Reference}=Is boolean:K8:9)
			$_Ptr_ReturnValue->:=OB Get:C1224($_ptr_attributes->; $_t_attributeName)
		: ($_l_Type=Text array:K8:16) & ($_al_AttributeTypes{$_l_Reference}=Text array:K8:16)
			OB GET ARRAY:C1229($_ptr_attributes->; $_t_attributeName; $_Ptr_ReturnValue->)
		: ($_l_Type=LongInt array:K8:19) & ($_al_AttributeTypes{$_l_Reference}=LongInt array:K8:19)
			OB GET ARRAY:C1229($_ptr_attributes->; $_t_attributeName; $_Ptr_ReturnValue->)
		: ($_l_Type=Real array:K8:17) & ($_al_AttributeTypes{$_l_Reference}=Real array:K8:17)
			OB GET ARRAY:C1229($_ptr_attributes->; $_t_attributeName; $_Ptr_ReturnValue->)
		: ($_l_Type=Boolean array:K8:21) & ($_al_AttributeTypes{$_l_Reference}=Boolean array:K8:21)
			OB GET ARRAY:C1229($_ptr_attributes->; $_t_attributeName; $_Ptr_ReturnValue->)
		: ($_l_Type=Date array:K8:20) & ($_al_AttributeTypes{$_l_Reference}=Date array:K8:20)
			OB GET ARRAY:C1229($_ptr_attributes->; $_t_attributeName; $_Ptr_ReturnValue->)
		: ($_l_Type=Time array:K8:29) & ($_al_AttributeTypes{$_l_Reference}=Time array:K8:29)
			OB GET ARRAY:C1229($_ptr_attributes->; $_t_attributeName; $_Ptr_ReturnValue->)
	End case 
End if 
ERR_MethodTrackerReturn("SD2_GetAttributeValue"; $_t_oldMethodName)