
If (False:C215)
	//Object Name:      [TYPES].types_in.oDefaultWorkAddress
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
	C_LONGINT:C283(TYP_l_DefaultHomeAddress; TYP_l_DefaultWorkAddress; TYP_l_nonDefaultAddress)
	C_OBJECT:C1216($_obj_Save; $_obj_type; $_obj_types)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$_obj_types:=ds:C1482.TYPES.query("TypeAttributes.addresstypedefault =:1 and Type_Code #:2 "; 1; [TYPES:5]Type_Code:1)
		
		If ($_obj_types.length>0)
			$_obj_type:=$_obj_types[0]
			CONFIRM:C162($_obj_types[0].Type_Name+" is already designated as the default work address type. Do you wish to change it to "+[TYPES:5]Type_Name:2+"?"; "No"; "Yes")
			If (OK=0)
				OB SET:C1220($_obj_type.TypeAttributes; "addresstypedefault"; 0)
				//$_obj_types[0].TypeAttributes.addresstypedefault:=0
				$_obj_Save:=$_obj_type.save(dk auto merge:K85:24)
				Case of 
					: ($_obj_Save.success)
						
					: ($_obj_Save.status=dk status automerge failed:K85:25)
						ALERT:C41($_obj_Save.statusText)
				End case 
				OB SET:C1220([TYPES:5]TypeAttributes:9; "addresstypedefault"; 1)
				
				
				TYP_l_nonDefaultAddress:=0
				TYP_l_DefaultWorkAddress:=1
				TYP_l_DefaultHomeAddress:=0
			End if 
			OK:=1
		Else 
			//If (Not([TYPES]TypeAttributes.addresstypedefault=Null)
			OB SET:C1220([TYPES:5]TypeAttributes:9; "addresstypedefault"; 1)
			
			TYP_l_nonDefaultAddress:=0
			TYP_l_DefaultWorkAddress:=1
			
			TYP_l_DefaultHomeAddress:=0
		End if 
		
		
End case 
