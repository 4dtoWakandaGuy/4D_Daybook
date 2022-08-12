//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Startup_Page2Ex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(LB_ad_01_1;0)
	//ARRAY REAL(LB_ar_01_1;0)
	//ARRAY REAL(LB_ar_01_2;0)
	//ARRAY REAL(LB_ar_01Real1;0)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	C_LONGINT:C283($_l_Index; $_l_SizeOfArray)
	C_TEXT:C284($_t_FieldDelimiter; $_t_oldMethodName; $_t_RecordDelimiter; vPeriod; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup_Page2Ex")
//Startup_Page2Ex

Case of 
	: (vTitle="Sales@")
		SET CHANNEL:C77(12; "SLOpeBal.TXT")
	: (vTitle="Purch@")
		SET CHANNEL:C77(12; "PLOpeBal.TXT")
	Else 
		SET CHANNEL:C77(12; "GLOpeBal.TXT")
End case 
If (OK=1)
	$_t_RecordDelimiter:=Char:C90(13)
	$_t_FieldDelimiter:=Char:C90(9)
	SEND PACKET:C103("Period:"+$_t_FieldDelimiter+vPeriod+$_t_RecordDelimiter)
	Case of 
		: ((vTitle="Sales@") | (vTitle="Purch@"))
			$_l_SizeOfArray:=Size of array:C274(LB_at_01_1)
			For ($_l_Index; 1; $_l_SizeOfArray)
				SEND PACKET:C103(LB_at_01_1{$_l_Index}+$_t_FieldDelimiter+LB_at_01_2{$_l_Index}+$_t_FieldDelimiter+LB_at_01_3{$_l_Index}+$_t_FieldDelimiter+String:C10(LB_ad_01_1{$_l_Index})+$_t_FieldDelimiter+String:C10(LB_ar_01_1{$_l_Index})+$_t_RecordDelimiter)
			End for 
			
		: (vTitle="Gene@")
			$_l_SizeOfArray:=Size of array:C274(LB_at_01_1)
			For ($_l_Index; 1; $_l_SizeOfArray)
				SEND PACKET:C103(LB_at_01_1{$_l_Index}+$_t_FieldDelimiter+LB_at_01_2{$_l_Index}+$_t_FieldDelimiter+String:C10(LB_ar_01_1{$_l_Index})+$_t_FieldDelimiter+String:C10(LB_ar_01_2{$_l_Index})+$_t_RecordDelimiter)
			End for 
			
	End case 
End if 
SET CHANNEL:C77(11)
ERR_MethodTrackerReturn("Startup_Page2Ex"; $_t_oldMethodName)
