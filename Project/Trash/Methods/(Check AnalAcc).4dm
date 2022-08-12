//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check AnalAcc
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
	ARRAY TEXT:C222($_at_AllAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_applicableAnalysisCodes; 0)
	C_BOOLEAN:C305(<>PER_bo_AnalysisOnly; $_bo_Alert; $0; $4)
	C_LONGINT:C283($_l_AnalysisRow; $_l_index; $3)
	C_POINTER:C301($1; $2; $5)
	C_TEXT:C284($_t_AnalysisCode; $_t_oldMethodName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check AnalAcc")
DB_t_Methodname:=Current method name:C684
If (Count parameters:C259>=4)
	$_bo_Alert:=$4
Else 
	$_bo_Alert:=True:C214
End if 
If (GenValidatePointer($1))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
	If ($1->#"")
		If ([ACCOUNTS:32]Account_Code:2#$1->)
			
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$1->)
		End if 
	Else 
		REDUCE SELECTION:C351([ACCOUNTS:32]; 0)
	End if 
End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
If ([ACCOUNTS:32]Account_Code:2#"")
	QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
	
	If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0) & (BLOB size:C605([ACCOUNTS:32]xLayerCodes:11)=0)
		If (GenValidatePointer($2))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
			
			$_t_AnalysisCode:=$2->
			If ($_t_AnalysisCode#"")
				QUERY SELECTION:C341([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Analysis_Code:1=$_t_AnalysisCode)
				If (Records in selection:C76([ACCOUNTS_ANALYSES:157])=0)
					Case of 
						: ($3=1)
							If ($_bo_Alert)
								Gen_Alert("Account "+$1->+" is not applicable to"+Char:C90(13)+"Analysis "+$2->; "Try again")
							End if 
							$1->:=""
							GOTO OBJECT:C206($1->)
							REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  //NG Added May 2004
							
							//QUERY([ACCOUNTS];[ACCOUNTS]Account Code="zxcz22")NG Removed May 2004
						: ($3=-1)  //Added NG may 2004 for area list handling
							If ($_bo_Alert)
								Gen_Alert("Account "+$1->+" is not applicable to"+Char:C90(13)+"Analysis "+$2->; "Try again")
							End if 
							If (GenValidatePointer($5))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
								
								$5->:=1
							End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
							
							If (GenValidatePointer($1))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
								
								$1->:=""
							End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
							
							REDUCE SELECTION:C351([ACCOUNTS:32]; 0)  //NG Added May 2004
							
						Else 
							If ($_bo_Alert)
								Gen_Alert("Analysis "+$2->+" is not applicable to"+Char:C90(13)+"Account "+$1->; "Try again")
							End if 
							
							If (<>PER_bo_AnalysisOnly)
								If (GenValidatePointer($1))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
									
									$1->:=""
									GOTO OBJECT:C206($1->)
								End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
								
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2="zxcz22")
							Else 
								$2->:=""
								GOTO OBJECT:C206($2->)
								QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1="zxcz22")
							End if 
					End case 
					$0:=False:C215
				Else 
					$0:=True:C214
				End if 
			End if 
		End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
		
		
	Else 
		If (BLOB size:C605([ACCOUNTS:32]xLayerCodes:11)>0)
			ARRAY TEXT:C222($_at_applicableAnalysisCodes; 0)
			
			BLOB TO VARIABLE:C533([ACCOUNTS:32]xAnalysisCodes:12; $_at_applicableAnalysisCodes)
			ALL RECORDS:C47([ANALYSES:36])
			SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Code:1; $_at_AllAnalysisCodes)
			
			For ($_l_index; Size of array:C274($_at_applicableAnalysisCodes); 1; -1)
				$_l_AnalysisRow:=Find in array:C230($_at_AllAnalysisCodes; $_at_applicableAnalysisCodes{$_l_index})
				If ($_l_AnalysisRow<0)
					DELETE FROM ARRAY:C228($_at_applicableAnalysisCodes; $_l_index)
				End if 
			End for 
			If (Size of array:C274($_at_applicableAnalysisCodes)>0)
				If (GenValidatePointer($2))  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
					
					$_l_AnalysisRow:=Find in array:C230($_at_applicableAnalysisCodes; $2->)
				Else   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
					
					$_l_AnalysisRow:=-1  //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
					
				End if   //Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
				
				
				If ($_l_AnalysisRow>0)
					$0:=True:C214
				Else 
					$0:=False:C215
				End if 
				
			Else 
				$0:=True:C214
			End if 
		Else 
			$0:=True:C214
		End if 
	End if 
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("Check AnalAcc"; $_t_oldMethodName)