If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SP_rb_Choice1)
	//C_UNKNOWN(SP_rb_Choice2)
	//C_UNKNOWN(SP_rb_Choice3)
	//ARRAY LONGINT(SP_al_SPeriodFromID2;0)
	//ARRAY LONGINT(SP_al_SPExistingID;0)
	//ARRAY LONGINT(SP_al_SPLinkedID2;0)
	//ARRAY REAL(SP_ar_SPTargetAmount;0)
	//ARRAY REAL(SP_ar_SPTargetAmount2;0)
	//ARRAY REAL(SP_ar_SPTargetResult2;0)
	//ARRAY REAL(SP_R_aSPTargetResult2;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ExistingIDROw; SP_l_BasedOnTarget; SP_l_Continue; SP_rb_Choice1; SP_rb_Choice2; SP_rb_Choice3; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_AmountsIndex; $_l_CurrentWinRefOLD)
	C_LONGINT:C283($_l_ExistingIDROw; SP_l_BasedOnTarget; SP_l_Continue; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_Amount2; SP_R_AFTargetAmount; SP_R_AFTargetAmount2; SP_R_AFTargetAmount3; $_r_Amount; $_r_Amount2; SP_R_AFTargetAmount; SP_R_AFTargetAmount2; SP_R_AFTargetAmount3)
	C_TEXT:C284(SP_t_FPlusMinus; $_t_oldMethodName; SP_t_FPlusMinus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Variable7"; Form event code:C388)
//here we want to know whether they want the autofill to do the following
//1 Fill all the same
//2 Fill each on based on the previous+ or minus
//3Base on the previous year
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
DIALOG:C40([USER:15]; "SP_ChooseAutoFiLL")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (SP_l_Continue>0)
	Case of 
		: (SP_rb_Choice1=1)
			//all to same amount
			For ($_l_AmountsIndex; 1; Size of array:C274(SP_ar_SPTargetAmount))
				SP_ar_SPTargetAmount{$_l_AmountsIndex}:=SP_R_AFTargetAmount
			End for 
			//AL_UpdateArrays (SP_Powerview;-2)
			
		: (SP_rb_Choice2=1)
			//based on + or minus last one
			SP_ar_SPTargetAmount{1}:=SP_R_AFTargetAmount
			For ($_l_AmountsIndex; 2; Size of array:C274(SP_ar_SPTargetAmount))
				Case of 
					: (SP_R_AFTargetAmount2>0)
						If (SP_t_FPlusMinus="-")
							//reduce
							SP_R_AFTargetAmount:=SP_R_AFTargetAmount-SP_R_AFTargetAmount2
						Else 
							SP_R_AFTargetAmount:=SP_R_AFTargetAmount+SP_R_AFTargetAmount2
							//increase
						End if 
						SP_ar_SPTargetAmount{$_l_AmountsIndex}:=SP_R_AFTargetAmount
					: (SP_R_AFTargetAmount3>0)
						$_r_Amount:=Round:C94((SP_R_AFTargetAmount*SP_R_AFTargetAmount3)/100; 2)
						If (SP_t_FPlusMinus="-")
							//reduce
							SP_R_AFTargetAmount:=SP_R_AFTargetAmount-$_r_Amount
						Else 
							//increase
							SP_R_AFTargetAmount:=SP_R_AFTargetAmount+$_r_Amount
						End if 
						SP_ar_SPTargetAmount{$_l_AmountsIndex}:=SP_R_AFTargetAmount
				End case 
			End for 
			
			
		: (SP_rb_Choice3=1)
			For ($_l_AmountsIndex; 1; Size of array:C274(SP_al_SPeriodFromID2))
				If (SP_al_SPLinkedID2{$_l_AmountsIndex}>0)
					$_l_ExistingIDROw:=Find in array:C230(SP_al_SPExistingID; SP_al_SPLinkedID2{$_l_AmountsIndex})
				Else 
					//ng this cannot be correct!!! April 2020
					$_l_ExistingIDROw:=Abs:C99(SP_al_SPLinkedID2{$_l_AmountsIndex})
				End if 
				If (SP_l_BasedOnTarget>0)
					$_r_Amount:=SP_ar_SPTargetAmount2{$_l_AmountsIndex}
				Else 
					$_r_Amount:=SP_ar_SPTargetResult2{$_l_AmountsIndex}
				End if 
				Case of 
					: (SP_R_AFTargetAmount2>0)
						If (SP_t_FPlusMinus="-")
							//reduce
							SP_R_AFTargetAmount:=$_r_Amount-SP_R_AFTargetAmount2
						Else 
							SP_R_AFTargetAmount:=$_r_Amount+SP_R_AFTargetAmount2
							//increase
						End if 
						SP_ar_SPTargetAmount{$_l_ExistingIDROw}:=SP_R_AFTargetAmount
					: (SP_R_AFTargetAmount3>0)
						$_r_Amount2:=Round:C94(($_r_Amount*SP_R_AFTargetAmount3)/100; 2)
						If (SP_t_FPlusMinus="-")
							//reduce
							SP_R_AFTargetAmount:=$_r_Amount-$_r_Amount2
						Else 
							//increase
							SP_R_AFTargetAmount:=$_r_Amount+$_r_Amount2
						End if 
						SP_ar_SPTargetAmount{$_l_ExistingIDROw}:=SP_R_AFTargetAmount
				End case 
				
				
				
			End for 
	End case 
	
	
End if 
ERR_MethodTrackerReturn("OBJ:Target_EntryForm,SP_l_AutoFIll1"; $_t_oldMethodName)
