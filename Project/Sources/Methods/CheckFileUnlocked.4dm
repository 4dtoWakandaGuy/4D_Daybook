//%attributes = {}
If (False:C215)
	//Project Method Name:      CheckFileUnlocked
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/01/2012 09:47
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $3; $_bo_MultipleNos)
	C_LONGINT:C283($_l_Delay; $_l_Repeats; $_l_Retries; $_l_TableNumber; $1; $2; $MpNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CheckFileUnlocked")
If (In transaction:C397)
	
	
	$_l_TableNumber:=$1
	$MpNumber:=$2
	$_bo_MultipleNos:=$3
	
	If ($_bo_MultipleNos)
		QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$_l_TableNumber; *)
		QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2=$MpNumber+9000)
		If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			$_bo_OK:=False:C215
			While (Not:C34($_bo_OK))
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 1)
				If (Not:C34($_bo_OK))
					If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
						//only increase every 10 tries
						$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
					End if 
					DelayTicks(2*$_l_Delay)
				End if 
			End while 
			UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
		End if 
	Else 
		QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$_l_TableNumber)
		If (Records in selection:C76([IDENTIFIERS:16])>0)
			$_l_Retries:=0
			$_bo_OK:=False:C215
			While (Not:C34($_bo_OK))
				
				$_l_Repeats:=0
				$_l_Delay:=1
				While (Not:C34($_bo_OK))
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[IDENTIFIERS:16]; 1)
					If (Not:C34($_bo_OK))
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
					End if 
				End while 
				If (Not:C34($_bo_OK))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(10*(1+$_l_Retries))
				End if 
			End while 
			
			UNLOAD RECORD:C212([IDENTIFIERS:16])
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("CheckFileUnlocked"; $_t_oldMethodName)