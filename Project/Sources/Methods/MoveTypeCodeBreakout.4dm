//%attributes = {}
If (False:C215)
	//Project Method Name:      MoveTypeCodeBreakout
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/10/2010 08:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_indexed)
	C_LONGINT:C283($_l_Clash; $_l_Clashes; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_LengthA; $_l_LengthB; $_l_LengthC; $_l_LengthD; $_l_Span; $_l_Span1OLD)
	C_LONGINT:C283($_l_Span2OLD; $_l_TableNumber; $_l_TestClash; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_TestClashSTR; $_t_TypeNoSTR; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MoveTypeCodeBreakout")
//NG May 2004
//this is the get-out clause!


Case of 
	: (Count parameters:C259=1)  //cant do much with it really!!
		//not if the field this is going into has a unique property the trigger will re-in
		$0:=(Random:C100%100000)+10
	: (Count parameters:C259>=2)
		//$2 is a pointer to the field
		
		
		$_l_FieldType:=0
		$_l_FieldLength:=0
		$_bo_indexed:=False:C215
		$_l_TestClash:=1
		$_l_Span:=1000
		$_l_Span1OLD:=1000
		Repeat 
			$_l_Clashes:=0
			Repeat 
				$_l_TestClash:=$_l_TestClash+$_l_Span
				$_l_LengthA:=Length:C16(String:C10($_l_TestClash))
				Case of 
					: (Count parameters:C259<2)
						$_t_TypeNoSTR:=("0"*(11-$_l_LengthA))+String:C10($_l_TestClash)
					: (Count parameters:C259=2)
						$_l_LengthB:=Length:C16($2)
						$_l_LengthC:=$_l_LengthB+$_l_LengthA
						$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TestClash)
					: (Count parameters:C259=3)
						$_l_LengthB:=Length:C16($2)
						$_l_LengthD:=Length:C16($3)
						$_l_LengthC:=$_l_LengthB+$_l_LengthA+$_l_LengthD
						$_t_TypeNoSTR:=("0"*(11-$_l_LengthC))+String:C10($_l_TestClash)
				End case 
				
				
				
				$_t_TestClashSTR:=$_t_TypeNoSTR
				If (Count parameters:C259>=1)
					Case of 
						: (Count parameters:C259=1)
							$_t_TestClashSTR:=$_t_TypeNoSTR
						: (Count parameters:C259=2)
							$_t_TestClashSTR:=$1+$_t_TypeNoSTR
						: (Count parameters:C259=3)
							$_t_TestClashSTR:=$1+$_t_TypeNoSTR+$3
							
					End case 
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Type_Number:4=$_t_TestClashSTR)
					SET QUERY DESTINATION:C396(0)
				End if 
				
				
				If ($_l_Clash>0)
					$_l_Clashes:=$_l_Clashes+1
					//$_l_Span:=Int($_l_Span+($_l_Span/2))
				End if 
				
			Until ($_l_Clash=0)
			$_l_Span2OLD:=$_l_Span
			$_l_Span:=$_l_Span1OLD
			$_l_Span:=Int:C8($_l_Span/2)
			$_l_Span1OLD:=$_l_Span
			If ($_l_Span>1)
				If ($_l_Clashes>0)
					$_l_TestClash:=$_l_TestClash-$_l_Span2OLD
				End if 
				
			End if 
			
		Until ($_l_Span<=1) | (<>SYS_bo_QuitCalled)
		$0:=$_l_TestClash
		
End case 
ERR_MethodTrackerReturn("MoveTypeCodeBreakout"; $_t_oldMethodName)
