//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_Dedup2Src
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(ch1; ch2; ch3; ch4; ch5; vNo)
	C_TEXT:C284($_t_oldMethodName; vCompany; vEvent; vPostcode; vTel; vTown)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_Dedup2Src")
$0:=True:C214
If (vNo=1)
	If (ch1=1)
		$0:=([COMPANIES:2]Company_Name:2=vCompany)
	End if 
	If ((ch2=1) & ($0))
		$0:=([COMPANIES:2]Address_Line_one:3=vEvent)
	End if 
	If ((ch3=1) & ($0))
		$0:=([COMPANIES:2]Town_or_City:5=vTown)
	End if 
	If ((ch4=1) & ($0))
		$0:=([COMPANIES:2]Postal_Code:7=vPostcode)
	End if 
	If ((ch5=1) & ($0))
		$0:=([COMPANIES:2]Telephone:9=vTel)
	End if 
Else 
	If (ch1=1)
		$0:=(Find in array:C230(GEN_at_Name; [COMPANIES:2]Company_Name:2)#-1)
	End if 
	If ((ch3=1) & ($0))
		$0:=(Find in array:C230(GEN_at_Identity; [COMPANIES:2]Town_or_City:5)#-1)
	End if 
	If ((ch4=1) & ($0))
		$0:=(Find in array:C230(GEN_at_RecordCode; [COMPANIES:2]Postal_Code:7)#-1)
	End if 
	If ((ch5=1) & ($0))
		$0:=(Find in array:C230(SVS_at_PreviewTypeN; [COMPANIES:2]Telephone:9)#-1)
	End if 
End if 
ERR_MethodTrackerReturn("Cont_Dedup2Src"; $_t_oldMethodName)