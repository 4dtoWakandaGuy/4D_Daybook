//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetReOccouring
	//------------------ Method Notes ------------------
	//NG This method will get re-occuring items(NOTE ITEMS) this is used as part of the diary search
	//$1=The start date of the current display range
	//$2=The end date of the current display range
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(<>SD_ad_SetDateFrom;0)
	ARRAY TEXT:C222($_at_CodesReturn; 0)
	ARRAY TEXT:C222($_at_DIaryCodes; 0)
	ARRAY TEXT:C222($_at_Reoccourance; 0)
	C_DATE:C307($_d_Date; $_d_Date2; $_d_FirstDate; $_d_LastDate; $1; $2)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetReOccouring")
QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4<<>SD_ad_SetDateFrom{$_l_Index}; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_To:33>=<>SD_ad_SetDateFrom{$_l_Index}; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67#"")  //ONLY FIND NON RE-OCCOURING
CREATE SET:C116([DIARY:12]; "AllReorrouning")
QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4<<>SD_ad_SetDateFrom{$_l_Index}; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_To:33=!00-00-00!; *)  //For ever!!
QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67#"")  //ONLY FIND NON RE-OCCOURING
CREATE SET:C116([DIARY:12]; "AllReorrouning2")
UNION:C120("AllReorrouning2"; "AllReorrouning"; "AllReorrouning")

USE SET:C118("AllReorrouning")
CLEAR SET:C117("AllReorrouning2")
//the first character in the string indicates the re-occourance type
//(for something to re-occour it has to have a pattern
//A=Annual
//M=Monthly
//D=Daily

//The next characters are contextual
//For monthly there are 12 these indicate which months! 111111111111(every month!) 100000000000(January)
//for  Weekly there are 5 11111=Every week of the month) 10000(first week of the month) yes some months have four weeks but still the string should be 5
//For Daily there are seven 111111 =every day 1000000=Sunday only

//The next characters indicate the DATES it is to appear with Daily this is not used
//Weekly this indicates the day of the week the item is to appear so 1 character 1=sunday 2=monday etc F=first day(so tuesday if monday is a holiday)
//For monthly this indicates the day of the month 01-31 or F for First day of month L for last day of month
//For Annual this will contain the Date
QUERY SELECTION:C341([DIARY:12]; [DIARY:12]X_REOCCOURANCE:67="A")
CREATE EMPTY SET:C140([DIARY:12]; "MatchAnnuals")
If (Count parameters:C259>=2)
	If (Records in selection:C76([DIARY:12])>0)
		//this will always find ALL annual items
		ARRAY TEXT:C222($_at_CodesReturn; 0)
		
		SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_DIaryCodes; [DIARY:12]X_REOCCOURANCE:67; $_at_Reoccourance)
		For ($_l_Index; 1; Size of array:C274($_at_DIaryCodes))
			$_d_FirstDate:=Date:C102("01/01/"+String:C10(Year of:C25($1)))
			If ($2#!00-00-00!)
				$_d_LastDate:=Date:C102("01/01/"+String:C10(Year of:C25($2)))
			Else 
				$_d_LastDate:=$_d_FirstDate
			End if 
			If ($_d_LastDate=$_d_FirstDate)
				$_d_Date:=$_d_FirstDate+(Num:C11(Substring:C12($_at_Reoccourance{$_l_Index}; 2; Length:C16($_at_Reoccourance{$_l_Index}))))
				If ($_d_Date>=$1)
					If ($2#!00-00-00!)
						If ($_d_Date<=$2)
							APPEND TO ARRAY:C911($_at_CodesReturn; $_at_DIaryCodes{$_l_Index})
						End if 
						
					Else 
						APPEND TO ARRAY:C911($_at_CodesReturn; $_at_DIaryCodes{$_l_Index})
					End if 
				End if 
			Else 
				//The end date of the current search is in a different year
				$_d_Date:=$_d_FirstDate+(Num:C11(Substring:C12($_at_Reoccourance{$_l_Index}; 2; Length:C16($_at_Reoccourance{$_l_Index}))))
				$_d_Date2:=$_d_LastDate+(Num:C11(Substring:C12($_at_Reoccourance{$_l_Index}; 2; Length:C16($_at_Reoccourance{$_l_Index}))))
				If ($_d_Date>=$1) & ($_d_Date2<=$2)
					APPEND TO ARRAY:C911($_at_CodesReturn; $_at_DIaryCodes{$_l_Index})
				End if 
				
			End if 
			
		End for 
		If (Size of array:C274($_at_CodesReturn)>0)
			QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_CodesReturn)
			CREATE SET:C116([DIARY:12]; "MatchAnnuals")
		End if 
	End if 
	USE SET:C118("AllReorrouning")
	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]X_REOCCOURANCE:67="M")
	//Check if this should appear this month
	CREATE EMPTY SET:C140([DIARY:12]; "MonthsMatch")
	If (Records in selection:C76([DIARY:12])>0)
		
	End if 
End if 
ERR_MethodTrackerReturn("SD2_GetReOccouring"; $_t_oldMethodName)
