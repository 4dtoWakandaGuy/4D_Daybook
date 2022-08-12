//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Startup_Page2Im
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY DATE(LB_ad_01_1;0)
	//ARRAY REAL(LB_ar_01_;0)
	//ARRAY REAL(LB_ar_01_1;0)
	//ARRAY REAL(LB_ar_01_2;0)
	//ARRAY REAL(LB_ar_01_String;0)
	ARRAY TEXT:C222($_at_Columns; 0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CurrentProcess; $_l_Index; $_l_SizeofArray)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284($_t_AcountName; $_t_FieldDelimiter; $_t_First; $_t_oldMethodName; $_t_RecordDelimiter; $1; vPeriod; vT; vText; vTitle)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup_Page2Im")
//Startup_Page2Im

<>SYS_l_CancelProcess:=0
$_l_CurrentProcess:=Current process:C322

ON ERR CALL:C155("Remote_Err")

If (Count parameters:C259=1)
	vDoc:=DB_OpenDocument($1)
Else 
	vDoc:=DB_OpenDocument("")
End if 
If (OK=1) & (Vdoc#?00:00:00?)
	
	$_t_RecordDelimiter:=Char:C90(13)
	$_t_FieldDelimiter:=Char:C90(9)
	RECEIVE PACKET:C104(vDoc; vText; $_t_RecordDelimiter)
	If (vText="Period:@")
		Gen_ImpStrip
		$_t_First:=First_Field(->vT; $_t_FieldDelimiter)
		vPeriod:=First_Field(->vT; $_t_FieldDelimiter)
		RECEIVE PACKET:C104(vDoc; vText; $_t_RecordDelimiter)
	End if 
	Case of 
		: ((vTitle="Sales@") | (vTitle="Purch@"))
			$_l_SizeofArray:=Size of array:C274(LB_at_01_1)
			While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
				Gen_ImpStrip
				$_l_SizeofArray:=$_l_SizeofArray+1
				$_t_First:=First_Field(->vT; $_t_FieldDelimiter)
				If (Character code:C91(Substring:C12($_t_First; 1; 1))=10)
					$_t_First:=Substring:C12($_t_First; 2; 32000)
				End if 
				If ($_t_First#"")
					INSERT IN ARRAY:C227(LB_at_01_1; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(LB_at_01_2; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(LB_at_01_3; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(LB_ad_01_1; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(LB_ar_01_1; $_l_SizeofArray; 1)
					LB_at_01_1{$_l_SizeofArray}:=$_t_First
					LB_at_01_2{$_l_SizeofArray}:=First_Field(->vT; $_t_FieldDelimiter)
					LB_at_01_3{$_l_SizeofArray}:=First_Field(->vT; $_t_FieldDelimiter)
					LB_ad_01_1{$_l_SizeofArray}:=Date:C102(First_Field(->vT; $_t_FieldDelimiter))
					LB_ar_01_1{$_l_SizeofArray}:=Num:C11(First_Field(->vT; $_t_FieldDelimiter))
				End if 
				RECEIVE PACKET:C104(vDoc; vText; $_t_RecordDelimiter)
			End while 
			vT1:=0
			For ($_l_Index; 1; $_l_SizeofArray)
				vT1:=vT1+LB_ar_01_1{$_l_Index}
				
			End for 
			ARRAY TEXT:C222($_at_Columns; 2)
			ARRAY TEXT:C222($_at_Values; 2)
			ARRAY TEXT:C222($_at_Formats; 2)
			$_at_Columns{1}:="Total Customers"
			$_at_Values{1}:=String:C10($_l_SizeofArray)
			$_at_Formats{1}:=""
			$_at_Columns{2}:="Total Outstanding"
			$_at_Values{2}:=String:C10(Vt1)
			$_at_Formats{2}:="|Accounts"
			LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
			
		: (vTitle="Gene@")
			While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
				Gen_ImpStrip
				$_t_First:=First_Field(->vT; $_t_FieldDelimiter)
				If (Character code:C91(Substring:C12($_t_First; 1; 1))=10)
					$_t_First:=Substring:C12($_t_First; 2; 32000)
				End if 
				$_t_AcountName:=First_Field(->vT; $_t_FieldDelimiter)
				If ($_t_First="")
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Name:3=$_t_AcountName)
					$_t_First:=[ACCOUNTS:32]Account_Code:2
				Else 
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$_t_First)
				End if 
				$_t_AcountName:=[ACCOUNTS:32]Account_Name:3
				$_t_First:=[ACCOUNTS:32]Account_Code:2
				If ($_t_First#"")
					$_l_SizeofArray:=Find in array:C230(LB_at_01_1; $_t_First)
					If ($_l_SizeofArray<1)
						$_l_SizeofArray:=Size of array:C274(LB_at_01_1)+1
						INSERT IN ARRAY:C227(LB_at_01_1; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(LB_at_01_2; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(LB_ar_01_1; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(LB_ar_01_2; $_l_SizeofArray; 1)
					End if 
					LB_at_01_1{$_l_SizeofArray}:=$_t_First
					LB_at_01_2{$_l_SizeofArray}:=$_t_AcountName
					LB_ar_01_1{$_l_SizeofArray}:=Num:C11(First_Field(->vT; $_t_FieldDelimiter))
					LB_ar_01_2{$_l_SizeofArray}:=Num:C11(First_Field(->vT; $_t_FieldDelimiter))
				End if 
				RECEIVE PACKET:C104(vDoc; vText; $_t_RecordDelimiter)
			End while 
			$_l_SizeofArray:=Size of array:C274(LB_at_01_1)
			vT1:=0
			vT2:=0
			For ($_l_Index; 1; $_l_SizeofArray)
				vT1:=vT1+LB_ar_01_1{$_l_Index}
				vT2:=vT2+LB_ar_01_2{$_l_Index}
			End for 
			ARRAY TEXT:C222($_at_Columns; 4)
			ARRAY TEXT:C222($_at_Values; 4)
			ARRAY TEXT:C222($_at_Formats; 4)
			$_at_Columns{1}:="Total Accounts"
			$_at_Values{1}:=String:C10($_l_SizeofArray)
			$_at_Formats{1}:=""
			$_at_Columns{2}:="Account balance"
			$_at_Values{2}:="Difference: "+String:C10(Round:C94((vT1-vT2); 2))
			$_at_Formats{2}:="|Accounts"
			$_at_Columns{3}:="Total Debit Amount"
			$_at_Values{3}:=String:C10(vT1)
			$_at_Formats{3}:="|Accounts"
			$_at_Columns{4}:="Total Credit AMount"
			$_at_Values{4}:=String:C10(vT2)
			$_at_Formats{4}:="|Accounts"
			
			LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
			
			
	End case 
	
	LB_GoToCell(->GEN_lb_ItemsArea; 1; $_l_SizeofArray)
	LB_SetScroll(->GEN_lb_ItemsArea; $_l_SizeofArray; 1)
	
	Close_DocUMENT(vDoc)
	If (Count parameters:C259=1)
		DELETE DOCUMENT:C159($1)
	End if 
End if 

ON ERR CALL:C155("")
ERR_MethodTrackerReturn("Startup_Page2Im"; $_t_oldMethodName)
