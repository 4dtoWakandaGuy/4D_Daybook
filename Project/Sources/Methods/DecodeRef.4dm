//%attributes = {}
If (False:C215)
	//Project Method Name:      DecodeRef
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/05/2010 21:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UseNegative)
	C_LONGINT:C283($_l_Difference; $_l_FieldNumber; $_l_Index; $_l_Index2; $_l_IndextemRef; $_l_Number; $_l_Start; $_l_TableNumber; $1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DecodeRef")
$0:=""
If (Count parameters:C259=0)
	$_l_Number:=Num:C11(Request:C163("What number"; ""))
Else 
	$_l_Number:=$1
End if 
If ($_l_Number>0)
	$_l_Start:=$_l_Number >> 24
	For ($_l_Index; $_l_Start; 1; -1)
		For ($_l_Index2; 1; 255)
			$_l_TableNumber:=$_l_Index << 24  //shift the number 24 bits to the left
			$_bo_UseNegative:=False:C215
			If ($_l_TableNumber<0)
				$_bo_UseNegative:=True:C214
				$_l_Difference:=$_l_Index-127
				$_l_TableNumber:=$_l_Difference << 24  //shift the number 24 bits to the left
			End if 
			$_l_FieldNumber:=$_l_Index2
			$_l_IndextemRef:=$_l_TableNumber | $_l_Index2
			If ($_bo_UseNegative)
				$_l_IndextemRef:=0-$_l_IndextemRef
			End if 
			If ($_l_Number=$_l_IndextemRef)
				If (Count parameters:C259=0)
					// ALERT(Table name($_l_Index)+":"+Field name($_l_Index;$_l_Index2))
					Gen_Alert(Table name:C256($_l_Index)+":"+Field name:C257($_l_Index; $_l_Index2))
				Else 
					$0:=Table name:C256($_l_Index)+":"+Field name:C257($_l_Index; $_l_Index2)
				End if 
				$_l_Index:=1
				$_l_Index2:=255
				
			End if 
			
		End for 
	End for 
Else 
	If (Count parameters:C259>0)
		$0:=""
	End if 
End if 
ERR_MethodTrackerReturn("DecodeRef"; $_t_oldMethodName)