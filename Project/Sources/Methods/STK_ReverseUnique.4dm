//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ReverseUnique
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/04/2010 21:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Exit; $_bo_NoDecode)
	C_LONGINT:C283($_l_FixedLength; $_l_LengthofUnique; $_l_LengthToSubract; $_l_PCLength)
	C_POINTER:C301($2; $3; $4; $5; $6)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_productCode; $_t_Type; $_t_UniqueWithoutProductCode; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ReverseUnique")
If (Count parameters:C259>=5)
	$_bo_NoDecode:=False:C215
	$_l_LengthofUnique:=Length:C16($1)
	$_l_FixedLength:=6*4
	$_l_PCLength:=$_l_LengthofUnique-$_l_FixedLength
	$_t_productCode:=Substring:C12($1; 1; $_l_PCLength)
	$_l_LengthToSubract:=Length:C16($_t_productCode)
	$_bo_Exit:=False:C215
	Repeat 
		If (Length:C16($_t_productCode)>0)
			If ($_t_productCode[[Length:C16($_t_productCode)]]=" ")
				$_t_productCode:=Substring:C12($_t_productCode; 1; Length:C16($_t_productCode)-1)
			Else 
				$_bo_Exit:=True:C214
			End if 
		End if 
	Until ($_bo_Exit) | (Length:C16($_t_productCode)=0)
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_productCode)
	If (Records in selection:C76([PRODUCTS:9])=0)
		$_l_FixedLength:=6*3
		$_l_PCLength:=$_l_LengthofUnique-$_l_FixedLength
		$_t_productCode:=Substring:C12($1; 1; $_l_PCLength)
		$_l_LengthToSubract:=Length:C16($_t_productCode)
		$_bo_Exit:=False:C215
		Repeat 
			If (Length:C16($_t_productCode)>0)
				If ($_t_productCode[[Length:C16($_t_productCode)]]=" ")
					$_t_productCode:=Substring:C12($_t_productCode; 1; Length:C16($_t_productCode)-1)
				Else 
					$_bo_Exit:=True:C214
				End if 
			End if 
		Until ($_bo_Exit) | (Length:C16($_t_productCode)=0)
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_productCode)
		
		If (Records in selection:C76([PRODUCTS:9])=0)
			$_l_FixedLength:=6*2
			$_l_PCLength:=$_l_LengthofUnique-$_l_FixedLength
			$_t_productCode:=Substring:C12($1; 1; $_l_PCLength)
			$_l_LengthToSubract:=Length:C16($_t_productCode)
			$_bo_Exit:=False:C215
			Repeat 
				If (Length:C16($_t_productCode)>0)
					If ($_t_productCode[[Length:C16($_t_productCode)]]=" ")
						$_t_productCode:=Substring:C12($_t_productCode; 1; Length:C16($_t_productCode)-1)
					Else 
						$_bo_Exit:=True:C214
					End if 
				End if 
			Until ($_bo_Exit) | (Length:C16($_t_productCode)=0)
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_productCode)
			If (Records in selection:C76([PRODUCTS:9])=0)
				$_l_FixedLength:=6*4
				$_l_PCLength:=$_l_LengthofUnique-$_l_FixedLength
				$_t_productCode:=Substring:C12($1; 1; $_l_PCLength)
				$_l_LengthToSubract:=Length:C16($_t_productCode)
				$_bo_Exit:=False:C215
				Repeat 
					If (Length:C16($_t_productCode)>0)
						If ($_t_productCode[[Length:C16($_t_productCode)]]=" ")
							$_t_productCode:=Substring:C12($_t_productCode; 1; Length:C16($_t_productCode)-1)
						Else 
							$_bo_Exit:=True:C214
						End if 
					End if 
				Until ($_bo_Exit) | (Length:C16($_t_productCode)=0)
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_productCode)
				If (Records in selection:C76([PRODUCTS:9])=0)
					$_bo_NoDecode:=True:C214
				Else 
					$_t_UniqueWithoutProductCode:=Substring:C12($1; $_l_LengthToSubract+1; Length:C16($1))
				End if 
			Else 
				$_t_UniqueWithoutProductCode:=Substring:C12($1; $_l_LengthToSubract+1; Length:C16($1))
			End if 
		Else 
			$_t_UniqueWithoutProductCode:=Substring:C12($1; $_l_LengthToSubract+1; Length:C16($1))
		End if 
	Else 
		$_t_UniqueWithoutProductCode:=Substring:C12($1; $_l_LengthToSubract+1; Length:C16($1))
	End if 
	
	$_t_LayerCode:=""
	$_t_Type:=""
	$_t_Type:=""
	$_t_AnalysisCode:=""
	$_t_CurrencyCode:=""
	If (Not:C34($_bo_NoDecode))
		$_t_CurrencyCode:=Substring:C12($_t_UniqueWithoutProductCode; 1; 6)  //The Currency code
		If (Length:C16($_t_UniqueWithoutProductCode)>7)
			$_t_LayerCode:=Substring:C12($_t_UniqueWithoutProductCode; 7; 6)  //26/01/04 pb
			If (Length:C16($_t_UniqueWithoutProductCode)>13)
				$_t_Type:=Substring:C12($_t_UniqueWithoutProductCode; 13; 6)  //6/01/04 pb
				If (Length:C16($_t_UniqueWithoutProductCode)>19)
					$_t_AnalysisCode:=Substring:C12($_t_UniqueWithoutProductCode; 19; 6)
				End if 
			End if 
		End if 
		
		$_bo_Exit:=False:C215
		Repeat 
			If ($_t_CurrencyCode[[1]]=" ")
				$_t_CurrencyCode:=Substring:C12($_t_CurrencyCode; 2)
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit) | (Length:C16($_t_CurrencyCode)=0)
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
			If ($_t_Type[[1]]=" ")
				$_t_Type:=Substring:C12($_t_Type; 2)
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit) | (Length:C16($_t_Type)=0)
		$_bo_Exit:=False:C215
		Repeat 
			If ($_t_AnalysisCode[[1]]=" ")
				$_t_AnalysisCode:=Substring:C12($_t_AnalysisCode; 2)
			Else 
				$_bo_Exit:=True:C214
			End if 
		Until ($_bo_Exit) | (Length:C16($_t_AnalysisCode)=0)
	End if 
	$2->:=$_t_CurrencyCode
	$3->:=$_t_LayerCode
	$4->:=$_t_Type
	$5->:=$_t_AnalysisCode
	$6->:=$_t_productCode
	
Else 
	//error
End if 
ERR_MethodTrackerReturn("STK_ReverseUnique"; $_t_oldMethodName)
