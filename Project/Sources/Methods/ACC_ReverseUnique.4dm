//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ReverseUnique
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Exit)
	C_POINTER:C301($2; $3; $4; $5; $6)
	C_TEXT:C284($_t_AccountCode; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_PeriodCode; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ReverseUnique")
// ACC_ReverseUnique
//pass this method an account unique value and it will return in the variables
//$2 etc are pointing to, the analysiss etc
// Completely re-written 26/01/04 pb
//NG modified Feb 2004
//because the while loop would create an error if compiled and length is 0
If (Count parameters:C259>=6)
	If (Length:C16($1)=42)
		$_t_AccountCode:=Substring:C12($1; 1; 10)  //account
		//   $_t_AnalysisCode:=Substring($1;11;10)  `analysis
		//   $_t_PeriodCode:=Substring($1;21;10)  `period
		$_t_PeriodCode:=Substring:C12($1; 11; 10)  //26/01/04 pb
		$_t_AnalysisCode:=Substring:C12($1; 21; 10)  //6/01/04 pb
		$_t_LayerCode:=Substring:C12($1; 31; 6)
		$_t_CurrencyCode:=Substring:C12($1; 37; 6)
		$_bo_Exit:=False:C215
		Repeat 
			If ($_t_AccountCode[[1]]=" ")
				$_t_AccountCode:=Substring:C12($_t_AccountCode; 2)
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit) | (Length:C16($_t_AccountCode)=0)
		$_bo_Exit:=False:C215
		Repeat 
			If ($_t_AnalysisCode[[1]]=" ")
				$_t_AnalysisCode:=Substring:C12($_t_AnalysisCode; 2)
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit) | (Length:C16($_t_AnalysisCode)=0)
		$_bo_Exit:=False:C215
		Repeat 
			If ($_t_PeriodCode[[1]]=" ")
				$_t_PeriodCode:=Substring:C12($_t_PeriodCode; 2)
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit) | (Length:C16($_t_PeriodCode)=0)
		$_bo_Exit:=False:C215
		Repeat 
			If ($_t_LayerCode[[1]]=" ")
				$_t_LayerCode:=Substring:C12($_t_LayerCode; 2)
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit) | (Length:C16($_t_LayerCode)=0)
		$_bo_Exit:=False:C215
		Repeat 
			If ($_t_CurrencyCode[[1]]=" ")
				$_t_CurrencyCode:=Substring:C12($_t_CurrencyCode; 2)
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit) | (Length:C16($_t_CurrencyCode)=0)
		
		
		
		$2->:=$_t_AccountCode
		$3->:=$_t_AnalysisCode
		$4->:=$_t_PeriodCode
		$5->:=$_t_LayerCode
		$6->:=$_t_CurrencyCode
		
	Else 
		//error
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_ReverseUnique"; $_t_oldMethodName)
