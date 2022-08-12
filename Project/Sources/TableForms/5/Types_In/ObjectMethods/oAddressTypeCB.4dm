
If (False:C215)
	//Object Name:      [TYPES].types_in.oAddressType
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/05/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Type; TYP_l_DefaultHomeAddress; TYP_l_DefaultWorkAddress; TYP_l_nonDefaultAddress)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If ([TYPES:5]UseAsAddressType:8)
			OBJECT SET VISIBLE:C603(*; "oNonDefaultAddress"; [TYPES:5]UseAsAddressType:8)
			OBJECT SET VISIBLE:C603(*; "oDefaultWorkAddress"; [TYPES:5]UseAsAddressType:8)
			OBJECT SET VISIBLE:C603(*; "oDefaultHomeAddress"; [TYPES:5]UseAsAddressType:8)
			If ([TYPES:5]UseAsAddressType:8)
				If (Not:C34([TYPES:5]TypeAttributes:9.addresstypedefault=Null:C1517))
					
					$_l_Type:=[TYPES:5]TypeAttributes:9.addresstypedefault
					TYP_l_nonDefaultAddress:=Num:C11($_l_Type=0)
					TYP_l_DefaultWorkAddress:=Num:C11($_l_Type=1)
					TYP_l_DefaultHomeAddress:=Num:C11($_l_Type=2)
				End if 
			End if 
			
			If (Not:C34([TYPES:5]TypeAttributes:9=Null:C1517))
				If ([TYPES:5]TypeAttributes:9.addresstypedefault=Null:C1517)
					TYP_l_nonDefaultAddress:=1
					TYP_l_DefaultWorkAddress:=0
					TYP_l_DefaultHomeAddress:=0
				Else 
					Case of 
						: ([TYPES:5]TypeAttributes:9.addresstypedefault=0)
							TYP_l_nonDefaultAddress:=1
							TYP_l_DefaultWorkAddress:=0
							TYP_l_DefaultHomeAddress:=0
						: ([TYPES:5]TypeAttributes:9.addresstypedefault=0)
							TYP_l_nonDefaultAddress:=0
							TYP_l_DefaultWorkAddress:=1
							TYP_l_DefaultHomeAddress:=0
							
						: ([TYPES:5]TypeAttributes:9.addresstypedefault=0)
							TYP_l_nonDefaultAddress:=0
							TYP_l_DefaultWorkAddress:=0
							TYP_l_DefaultHomeAddress:=1
					End case 
				End if 
			End if 
			
		End if 
		
		
		
End case 
