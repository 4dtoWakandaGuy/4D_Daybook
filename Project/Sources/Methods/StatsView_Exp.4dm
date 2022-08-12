//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Exp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/04/2010 19:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY REAL(aSV3;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_Field1Relation;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_ArraySize; $_l_Index; $_l_Name; bd12; bd13; r2; vSVT1; vSVT2)
	C_REAL:C285(vSVT3; vSVT4)
	C_TEXT:C284($_t_DocumentName; $_t_DocumentPath; $_t_Extension; $_t_oldMethodName; vFld; vRec; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5)
	C_TEXT:C284(vTitle6; vTitle7; vTitle8; vTitle9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Exp")
//StatsView_Print

<>SYS_l_CancelProcess:=0
If (bd12=1)
	StatsView_Cal2
	bd12:=0
End if 
If (<>SYS_l_CancelProcess#Current process:C322)
	vTitle1:=DB_at_TableName{1}+" STATISTICS"
	Gen_Confirm("Please name the export file for "+vTitle1; "OK"; "Cancel")
	If (OK=1)
		StatsView_Title
		Gen_Delimiters
		SET CHANNEL:C77(12; "")
		If (OK=1)
			SEND PACKET:C103(vTitle1+vRec+String:C10(<>DB_d_CurrentDate)+vRec+vRec)
			If ((r2=1) & (bd13=0) & (SV_at_Field1Relation{SV_at_FieldName1}#"") & (SV_at_Field1Relation{SV_at_FieldName1}#"*"))
				$_l_Name:=1
			Else 
				$_l_Name:=0
			End if 
			SEND PACKET:C103(vTitle2+vFld+(vFld*$_l_Name)+vTitle4+vFld+vTitle6+vFld+vTitle8+vRec)
			SEND PACKET:C103(vTitle3+vFld+(("Name"+vFld)*$_l_Name)+vTitle5+vFld+vTitle7+vFld+vTitle9+vRec+vRec)
			$_l_ArraySize:=Size of array:C274(aSV1)
			$_l_Index:=1
			While (($_l_Index<=$_l_ArraySize) & (<>SYS_l_CancelProcess#Current process:C322))
				SEND PACKET:C103(aSV1{$_l_Index}+vFld+((aSVN1{$_l_Index}+vFld)*$_l_Name)+String:C10(aSV2{$_l_Index})+vFld+String:C10(aSV3{$_l_Index}; "|Accounts")+vFld+String:C10(aSV4{$_l_Index}; "|Accounts")+vRec)
				$_l_Index:=$_l_Index+1
			End while 
			SEND PACKET:C103(vRec+String:C10(vSVT1)+vFld+(vFld*$_l_Name)+String:C10(vSVT2; "|Accounts")+vFld+String:C10(vSVT3; "|Accounts")+vFld+String:C10(vSVT4; "|Accounts")+vRec)
			SET CHANNEL:C77(11)
			$_t_DocumentName:=FileNamefromPath(Document)
			$_t_DocumentPath:=PathFromPathName(document)
			If (Length:C16($_t_DocumentName)>=4)
				$_t_Extension:=Substring:C12($_t_DocumentName; (Length:C16($_t_DocumentName)-3); Length:C16($_t_DocumentName))
				
				If ($_t_Extension[[1]]#".")
					$_t_DocumentName:=$_t_DocumentName+".txt"
					COPY DOCUMENT:C541(document; $_t_DocumentPath+$_t_DocumentName)
					DELETE DOCUMENT:C159(document)
					
				End if 
			Else 
				//can be
				$_t_DocumentName:=$_t_DocumentName+".txt"
				COPY DOCUMENT:C541(document; $_t_DocumentPath+$_t_DocumentName)
				DELETE DOCUMENT:C159(document)
				
				
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("StatsView_Exp"; $_t_oldMethodName)