//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_Arr2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2010 17:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Com_at_CompanyDataDisplay;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	C_LONGINT:C283($_l_Element; $1; $3)
	C_TEXT:C284($_t_oldMethodName; $10; $11; $12; $13; $14; $2; $4; $5; $6; $7)
	C_TEXT:C284($8; $9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_Arr2")
If (Count parameters:C259>=3)
	$_l_Element:=$3
Else 
	$_l_Element:=<>Com_at_CompanyDataDisplay
End if 
Case of 
	: ($_l_Element=1)
		If (Count parameters:C259>=5)
			GEN_at_Identity{$1}:=$5
		Else 
			GEN_at_Identity{$1}:=Substring:C12([COMPANIES:2]Town_or_City:5; 1; 20)
		End if 
	: ($_l_Element=2)
		If (Count parameters:C259>=6)
			GEN_at_Identity{$1}:=$6
		Else 
			GEN_at_Identity{$1}:=Substring:C12([COMPANIES:2]County_or_State:6; 1; 20)
		End if 
	: ($_l_Element=3)
		If (Count parameters:C259>=7)
			GEN_at_Identity{$1}:=$7
		Else 
			GEN_at_Identity{$1}:=[COMPANIES:2]Postal_Code:7
		End if 
	: ($_l_Element=4)
		If (Count parameters:C259>=7)
			GEN_at_Identity{$1}:=$8
		Else 
			GEN_at_Identity{$1}:=Substring:C12([COMPANIES:2]Country:8; 1; 20)
		End if 
	: ($_l_Element=5)
		If (Count parameters:C259>=9)
			GEN_at_Identity{$1}:=$9
		Else 
			GEN_at_Identity{$1}:=Substring:C12([COMPANIES:2]Telephone:9; 1; 20)
		End if 
	: ($_l_Element=6)
		If (Count parameters:C259>=10)
			GEN_at_Identity{$1}:=$10
		Else 
			GEN_at_Identity{$1}:=Substring:C12([COMPANIES:2]Fax:10; 1; 20)
		End if 
	: ($_l_Element=7)
		If (Count parameters:C259>=11)
			GEN_at_Identity{$1}:=$11
		Else 
			GEN_at_Identity{$1}:=[COMPANIES:2]Status:12
		End if 
	: ($_l_Element=8)
		
		If ($2="MC")
			If (Count parameters:C259>=4)
				GEN_at_Identity{$1}:=$4
			Else 
				GEN_at_Identity{$1}:=[CONTACTS_COMPANIES:145]Address_Type:2
			End if 
		Else 
			If (Count parameters:C259>=12)
				GEN_at_Identity{$1}:=$12
			Else 
				GEN_at_Identity{$1}:=[COMPANIES:2]Company_Type:13
			End if 
		End if 
		
	: ($_l_Element=9)
		If (Count parameters:C259>=13)
			GEN_at_Identity{$1}:=$13
		Else 
			GEN_at_Identity{$1}:=[COMPANIES:2]Source:14
		End if 
	: ($_l_Element=10)
		If (Count parameters:C259>=14)
			GEN_at_Identity{$1}:=$14
		Else 
			GEN_at_Identity{$1}:=[COMPANIES:2]Area:11
		End if 
End case 
ERR_MethodTrackerReturn("Companies_Arr2"; $_t_oldMethodName)