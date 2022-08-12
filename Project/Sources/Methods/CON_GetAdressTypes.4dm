//%attributes = {}

If (False:C215)
	//Project Method Name:      CON_GetAdressTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Position)
	C_OBJECT:C1216($_obj_Home; $_obj_HomeAddress; $_obj_Save; $_obj_work; $_obj_workAddress)
	C_POINTER:C301($_ptr_AddressTypesArray; $1)
End if 
//Code Starts Here
If (Count parameters:C259>=1)
	$_ptr_AddressTypesArray:=$1
	
	READ ONLY:C145([TYPES:5])
	QUERY:C277([TYPES:5]; [TYPES:5]UseAsAddressType:8=True:C214)
	SELECTION TO ARRAY:C260([TYPES:5]Type_Name:2; $_ptr_AddressTypesArray->)
	$_l_Position:=Find in array:C230($_ptr_AddressTypesArray->; "Home")
	If ($_l_Position<0)
		$_obj_HomeAddress:=ds:C1482.TYPES.query("Type_Name =:1"; "Home")
		If ($_obj_HomeAddress.length>0)
			$_obj_Home:=$_obj_HomeAddress[0]
			$_obj_Home.UseAsAddressType:=True:C214
			$_obj_Save:=$_obj_Home.save(dk auto merge:K85:24)
			Case of 
				: ($_obj_Save.success)
				: ($_obj_Save.status=dk status automerge failed:K85:25)
					ALERT:C41($_obj_Save.statusText)
			End case 
			
		End if 
		APPEND TO ARRAY:C911($_ptr_AddressTypesArray->; "Home")
	End if 
	$_l_Position:=Find in array:C230($_ptr_AddressTypesArray->; "Work")
	If ($_l_Position<0)
		$_obj_workAddress:=ds:C1482.TYPES.query("Type_Name =:1"; "Work")
		If ($_obj_workAddress.length>0)
			$_obj_work:=$_obj_workAddress[0]
			$_obj_work.UseAsAddressType:=True:C214
			$_obj_Save:=$_obj_work.save(dk auto merge:K85:24)
			Case of 
				: ($_obj_Save.success)
				: ($_obj_Save.status=dk status automerge failed:K85:25)
					ALERT:C41($_obj_Save.statusText)
			End case 
			
		End if 
		
		APPEND TO ARRAY:C911($_ptr_AddressTypesArray->; "Work")
	End if 
	SORT ARRAY:C229($_ptr_AddressTypesArray->; >)
	$_ptr_AddressTypesArray->:=0
	
End if 
