If (False:C215)
	//object Method Name: Object Name:      [COMPANIES].dOpening_Bal.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY DATE(LB_ad_01_1;0)
	//ARRAY REAL(LB_ar_01_1;0)
	//ARRAY REAL(LB_ar_01_2;0)
	ARRAY TEXT:C222($_at_Columns; 0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	C_LONGINT:C283($_l_SizeOfArray)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284($_t_oldMethodName; vTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dOpening_Bal.Variable8"; Form event code:C388)

Case of 
	: ((vTitle="Sales@") | (vTitle="Purch@"))
		$_l_SizeOfArray:=Size of array:C274(LB_at_01_1)
		INSERT IN ARRAY:C227(LB_at_01_1; $_l_SizeOfArray+1; 1)
		INSERT IN ARRAY:C227(LB_at_01_2; $_l_SizeOfArray+1; 1)
		INSERT IN ARRAY:C227(LB_at_01_3; $_l_SizeOfArray+1; 1)
		INSERT IN ARRAY:C227(LB_ad_01_1; $_l_SizeOfArray+1; 1)
		INSERT IN ARRAY:C227(LB_ar_01_1; $_l_SizeOfArray+1; 1)
		vT1:=0
		vT1:=Sum:C1(LB_ar_01_1)
		
		//For ($j;1;$_l_SizeOfArray)
		//IDLE  //7/04/03 pb
		//vT1:=vT1+LB_ar_01_1{$j}
		//End for 
		
		ARRAY TEXT:C222($_at_Columns; 3)
		ARRAY TEXT:C222($_at_Values; 3)
		ARRAY TEXT:C222($_at_Formats; 3)
		$_at_Columns{1}:="Total Customers"
		$_at_Values{1}:=String:C10($_l_SizeOfArray+1)
		$_at_Formats{1}:=""
		$_at_Columns{2}:="Account Balance"
		$_at_Values{2}:=String:C10(vT1)
		$_at_Formats{2}:="|Accounts"
		
		
		
		LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
	: (vTitle="Gene@")
		$_l_SizeOfArray:=Size of array:C274(LB_at_01_1)
		INSERT IN ARRAY:C227(LB_at_01_1; $_l_SizeOfArray+1; 1)
		INSERT IN ARRAY:C227(LB_at_01_2; $_l_SizeOfArray+1; 1)
		INSERT IN ARRAY:C227(LB_ar_01_1; $_l_SizeOfArray+1; 1)
		INSERT IN ARRAY:C227(LB_ar_01_2; $_l_SizeOfArray+1; 1)
		vT1:=0
		vT2:=0
		vT1:=Sum:C1(LB_ar_01_1)
		vT2:=Sum:C1(LB_ar_01_1)
		//For ($j;1;$_l_SizeOfArray)
		//IDLE  //7/04/03 pb
		//vT1:=vT1+LB_ar_01_1{$j}
		//vT2:=vT2+LB_ar_01_2{$j}
		//End for 
		ARRAY TEXT:C222($_at_Columns; 4)
		ARRAY TEXT:C222($_at_Values; 4)
		ARRAY TEXT:C222($_at_Formats; 4)
		$_at_Columns{1}:="Total Accounts"
		$_at_Values{1}:=String:C10($_l_SizeOfArray+1)
		$_at_Formats{1}:=""
		
		$_at_Columns{2}:="Account Balances"
		$_at_Values{12}:="Difference: "+String:C10(Round:C94((vT1-vT2); 2))
		$_at_Formats{2}:="|Accounts"
		$_at_Columns{3}:="Total Debits"
		$_at_Values{3}:=String:C10(vT1)
		$_at_Formats{3}:="|Accounts"
		$_at_Columns{4}:="Total Credits"
		$_at_Values{4}:=String:C10(vT2)
		$_at_Formats{4}:="|Accounts"
		
		LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
		
		
End case 

GOTO OBJECT:C206(GEN_lb_ItemsArea)

LB_GoToCell(->GEN_lb_ItemsArea; 1; $_l_SizeOfArray+1)
LB_SetScroll(->GEN_lb_ItemsArea; $_l_SizeOfArray+1; 1)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dOpening_Bal.Variable8"; $_t_oldMethodName)
