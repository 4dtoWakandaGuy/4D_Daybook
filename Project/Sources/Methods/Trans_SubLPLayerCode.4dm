//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_SubLPLayerCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $0)
	C_LONGINT:C283($3)
	C_POINTER:C301($1; $2; $4)
	C_TEXT:C284($_t_LayerCode; $_t_oldMethodName; DB_t_Methodname)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPLayerCode")
DB_t_Methodname:=Current method name:C684
$0:=False:C215
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
		
		If ([ACCOUNTS:32]Account_Code:2#$1->)
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$1->)
		End if 
		If (BLOB size:C605([ACCOUNTS:32]xLayerCodes:11)=0)
			QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
			If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
				If (GenValidatePointer($2))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
					
					$_t_LayerCode:=$2->
					QUERY SELECTION:C341([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Layer_Code:1=$_t_LayerCode)
					If (Records in selection:C76([ACCOUNTS_LAYERS:156])=0)
						Case of   //NG may 2004 changed from an if to a case of because extra bits
							: ($3=1)
								Gen_Alert("Account "+$1->+" is not applicable to"+Char:C90(13)+"Layer "+$2->; "Try again")
								$1->:=""
								GOTO OBJECT:C206($1->)
								REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  // NG Modified May 2004
								//QUERY([ACCOUNTS];[ACCOUNTS]Account Code="zxcz22")`Removed NG May 2004
							: ($3=-1)  //new section for area list
								Gen_Alert("Account "+$1->+" is not applicable to"+Char:C90(13)+"Layer "+$2->; "Try again")
								$1->:=""
								$4->:=1
								REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  // NG Modified May 2004
							: ($3=-2)  //new section for area list
								Gen_Alert("Layer "+$2->+" is not applicable to"+Char:C90(13)+"Account "+$1->; "Try again")
								$2->:=""
								$4->:=2
								REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  // NG Modified May 2004
							Else 
								Gen_Alert("Layer "+$2->+" is not applicable to"+Char:C90(13)+"Account "+$1->; "Try again")
								$2->:=""
								GOTO OBJECT:C206($2->)
								REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  // NG Modified May 2004
								//QUERY([LAYERS];[LAYERS]Layer Code="zxcz22")
						End case 
						$0:=False:C215
					Else 
						$0:=True:C214
					End if 
				End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
				
			Else 
				$0:=True:C214
			End if 
		Else 
			If (GenValidatePointer($2))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
				
				
				$_t_LayerCode:=$2->
				$_bo_OK:=ACC_LayerMatch($_t_LayerCode)
				If ($_bo_OK=False:C215)
					Case of   //NG may 2004 changed from an if to a case of because extra bits
						: ($3=1)
							Gen_Alert("Account "+$1->+" is not applicable to"+Char:C90(13)+"Layer "+$2->; "Try again")
							$1->:=""
							GOTO OBJECT:C206($1->)
							REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  // NG Modified May 2004
							//QUERY([ACCOUNTS];[ACCOUNTS]Account Code="zxcz22")`Removed NG May 2004
						: ($3=-1)  //new section for area list
							Gen_Alert("Account "+$1->+" is not applicable to"+Char:C90(13)+"Layer "+$2->; "Try again")
							$1->:=""
							$4->:=1
							REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  // NG Modified May 2004
						: ($3=-2)  //new section for area list
							Gen_Alert("Layer "+$2->+" is not applicable to"+Char:C90(13)+"Account "+$1->; "Try again")
							$2->:=""
							$4->:=2
							REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  // NG Modified May 2004
						Else 
							Gen_Alert("Layer "+$2->+" is not applicable to"+Char:C90(13)+"Account "+$1->; "Try again")
							$2->:=""
							GOTO OBJECT:C206($2->)
							REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  // NG Modified May 2004
							//QUERY([LAYERS];[LAYERS]Layer Code="zxcz22")
					End case 
					$0:=False:C215
					
				Else 
					$0:=True:C214
				End if 
				
			End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
			
			
		End if 
	End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
	
End if 
ERR_MethodTrackerReturn("Trans_SubLPLayerCode"; $_t_oldMethodName)
