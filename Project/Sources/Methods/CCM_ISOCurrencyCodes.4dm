//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_ISOCurrencyCodes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2012 17:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CCM_at_CurrencyCodes;0)
	//ARRAY TEXT(CCM_at_CurrencyNames;0)
	C_LONGINT:C283($_l_CurrentRow)
	C_TEXT:C284($_t_LoadOption; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_ISOCurrencyCodes")

If (Count parameters:C259>=1)
	
	$_t_LoadOption:=$1
Else 
	$_t_LoadOption:="FULL"
End if 
ARRAY TEXT:C222(CCM_at_CurrencyCodes; 255)
ARRAY TEXT:C222(CCM_at_CurrencyNames; 255)

$_l_CurrentRow:=0

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AED"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="United Arab Emirates, Dirhams"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="United Arab Emirates"
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AFA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Afghanistan, Afghanis"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Afghanistan"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ALL"
		
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Albania, Leke"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Albania"
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AMD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Armenia, Drams"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Armenia"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ANG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Netherlands Antilles, Guilders (also called Florins)"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Netherlands Antilles"
		
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AOA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Angola, Kwanza"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Angola"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="ARS"

Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Argentina, Pesos"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Argentina"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="AUD"

Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Australia, Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AU"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Australia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="AWG"

Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Aruba, Guilders (also called Florins)"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Aruba"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AZM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Azerbaijan, Manats"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Azerbaijan"
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BAM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bosnia and Herzegovina, Convertible Marka"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bosnia and Herzegovina"
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BBD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Barbados, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BB"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Barbados"
End case 

$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="BDT"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bangladesh, Taka"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bangladesh"
		
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="BGN"

Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bulgaria, Leva"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bulgaria"
		
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="BHD"

Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bahrain, Dinars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BH"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bahrain"
		
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BIF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Burundi, Francs"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Burundi"
		
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BMD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bermuda, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bermuda"
		
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BND"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Brunei Darussalam, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Brunei Darussalam"
		
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="BOB"

Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bolivia, Bolivianos"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bolivia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="BRL"


Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Brazil, Brazil Real"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Brazil"
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BSD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bahamas, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bahamas"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BTN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bhutan, Ngultrum"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bhutan"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BWP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Botswana, Pulas"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Botswana"
End case 

Case of 
		
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BYR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Belarus, Rubles"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BY"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Belarus"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BZD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Belize, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Belize"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="CAD"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Canada, Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Canada"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CDF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Congo/Kinshasa, Congolese Francs"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Congo, Kinshasa"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="CHF"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Switzerland, Francs"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CH"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Switzerland"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="CLP"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Chile, Pesos"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Chile"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="CNY"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="China, Yuan Renminbi"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="China"
		
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="COP"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Colombia, Pesos"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Colombia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="CRC"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Costa Rica, Colones"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Costa Rica"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="CSD"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Serbia, Dinars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ACS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Serbia"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CUP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cuba, Pesos"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CU"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cuba"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CVE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cape Verde, Escudos"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CV"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cape Verde"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="CYP"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cyprus, Pounds"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CY"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cyprus"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CZK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Czech Republic, Koruny"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Czech Republic"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="DJF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Djibouti, Francs"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="DJ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Djibouti"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="DKK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Denmark, Kroner"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="DK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Denmark"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="DOP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Dominican Republic, Pesos"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="DO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Dominican Republic"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="DZD"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Algeria, Algeria Dinars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="DZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Algeria"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="EEK"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Estonia, Krooni"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="EE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Estonia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="EGP"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Egypt, Pounds"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="RG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Egypt"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ERN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Eritrea, Nakfa"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ER"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Eritrea"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ETB"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Ethiopia, Birr"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ET"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Ethiopia"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="EUR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Euro Member Countries, Euro"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ES"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Spain"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Ireland"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Italy"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LU"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Luxembourg"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="FR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="France"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="DE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Germany"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Belgium"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Andorra"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Portugal"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Netherlands"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MC"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Monaco"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Montserrat"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Liechtenstein"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Iceland"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="VA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Holy See"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Greece"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="FI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Finland"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Austria"
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Andorra"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="FJD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Fiji, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="FJ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Fiji"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="FKP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Falkland Islands (Malvinas), Pounds"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="FK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Falkland Islands"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="GBP"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="United Kingdom, Pounds"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GB"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="United Kingdom"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GEL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Georgia, Lari"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Georgia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="GGP"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guernsey, Pounds"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GB"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guernsey"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="GHC"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Ghana, Cedis"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GH"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Ghana"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="GIP"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Gibraltar, Pounds"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Gibraltar"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="GMD"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Gambia, Dalasi"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Gambia"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GNF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guinea, Francs"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guinea"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GTQ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guatemala, Quetzales"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guatemala"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GYD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guyana, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GY"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guyana"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="HKD"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Hong Kong, Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="HK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Hong Kong"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="HNL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Honduras, Lempiras"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="HN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Honduras"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="HRK"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Croatia, Kuna"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="HR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Croatia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="HTG"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Haiti, Gourdes"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="HT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Haiti"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="HUF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Hungary, Forint"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="HU"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Hungary"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IDR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Indonesia, Rupiahs"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ID"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Indonesia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="ILS"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Israel, New Shekels"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Israel"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="IMP"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Isle of Man, Pounds"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GB"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Isle of Man"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="INR"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="India, Rupees"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="India"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="IQD"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Iraq, Dinars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IQ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Iraq"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="IRR"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Iran, Rials"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Iran"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="ISK"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Iceland, Kronur"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Iceland"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="JEP"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Jersey, Pounds"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GB"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Jersey"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="JMD"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Jamaica, Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="JM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Jamaica"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="JOD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Jordan, Dinars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="JO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Jordan"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="JPY"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Japan, Yen"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="JP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Japan"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="KES"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Kenya, Shillings"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Kenya"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="KGS"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Kyrgyzstan, Soms"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Kyrgyzstan"
End case 

Case of 
		
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KHR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cambodia, Riels"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KH"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cambodia"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KMF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Comoros, Francs"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Comoros"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KPW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Korea (North), Won"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Korea (North)"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="KRW"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Korea (South), Won"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Korea (South)"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="KWD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Kuwait, Dinars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Kuwait"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KYD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cayman Islands, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KY"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cayman Islands"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KZT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Kazakhstan, Tenge"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Kazakhstan"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LAK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Laos, Kips"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Laos"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="LBP"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Lebanon, Pounds"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LB"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Lebanon"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="LKR"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Sri Lanka, Rupees"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Sri Lanka"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="LRD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Liberia, Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Liberia"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LSL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Lesotho, Maloti"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Lesotho"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="LTL"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Lithuania, Litai"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Lithuania"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="LVL"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Latvia, Lati"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LV"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Latvia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="LYD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Libya, Dinars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LY"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Libya"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="MAD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Morocco, Dirhams"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Morocco"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MDL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Moldova, Lei"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Moldova"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MGA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Madagascar, Ariary"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Madagascar"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MKD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Macedonia, Denars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Macedonia"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MMK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Myanmar (Burma), Kyats"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Myanmar"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MNT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mongolia, Tugriks"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mongolia"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MOP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Macau, Patacas"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Macau"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MRO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mauritania, Ouguiyas"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mauritania"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="MTL"
Case of 
		
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Malta, Liri"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Malta"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MUR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mauritius, Rupees"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MU"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mauritius"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MVR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Maldives (Maldive Islands), Rufiyaa"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MVR"
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MV"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Maldives (Maldive Islands)"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="MWK"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Malawi, Kwachas"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Malawi"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="MXN"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mexico, Pesos"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MX"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mexico"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="MYR"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Malaysia, Ringgits"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MY"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Malaysia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="MZM"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mozambique, Meticais"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mozambique"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="NAD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Namibia, Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Namibia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="NGN"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Nigeria, Nairas"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Nigeria"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="NIO"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Nicaragua, Cordobas"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Nicaragua"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="NOK"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Norway, Krone"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Norway"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NPR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Nepal, Nepal Rupees"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Nepal"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="NZD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="New Zealand, Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="New Zealand"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="OMR"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Oman, Rials"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="OM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Oman"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="PAB"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Panama, Balboa"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Panama"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="PEN"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Peru, Nuevos Soles"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Peru"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PGK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Papua New Guinea, Kina"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Papua New Guinea"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="PHP"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Philippines, Pesos"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PH"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Philippines"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PKR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Pakistan, Rupees"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Pakistan"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="PLN"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Poland, Zlotych"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Poland"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="PYG"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Paraguay, Guarani"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PY"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Paraguay"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="QAR"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Qatar, Rials"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AQ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Qatar"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="ROL"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Romania, Lei"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="RO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Romania"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="RUB"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Russia, Rubles"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="RU"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Russia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="RWF"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Rwanda, Rwanda Francs"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="RW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Rwanda"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SAR"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Saudi Arabia, Riyals"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Saudi Arabia"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SBD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Solomon Islands, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SB"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Solomon Islands"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SCR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Seychelles, Rupees"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SC"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Seychelles"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SDD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Sudan, Dinars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Sudan"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SEK"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Sweden, Kronor"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Sweden"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SGD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Singapore, Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Singapore"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SHP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Saint Helena, Pounds"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SH"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Saint Helena"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SIT"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Slovenia, Tolars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Slovenia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SKK"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Slovakia, Koruny"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Slovakia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SLL"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Sierra Leone, Leones"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Sierra Leone"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SOS"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Somalia, Shillings"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Somalia"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SPL"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Seborga, Luigini"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Seborga"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SRD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Suriname, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Suriname"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="STD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="São Tome and Principe, Dobras"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ST"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="São Tome and Principe"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="SVC"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="El Salvador, Colones"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SV"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="El Salvador"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SYP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Syria, Pounds"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SY"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Syria"
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SZL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Swaziland, Emalangeni"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Swaziland"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="THB"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Thailand, Baht"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TH"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Thailand"
End case 


Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TJS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tajikistan, Somoni"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TJ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tajikistan"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TMM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Turkmenistan, Manats"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Turkmenistan"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TND"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tunisia, Dinars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tunisia"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TOP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tonga, Pa'anga"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tonga"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TRL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Turkey, Liras [being phased out]"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="TRY"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Turkey, New Lira"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Turkey"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TTD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Trinidad and Tobago, Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Trinidad and Tobago"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TVD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tuvalu, Tuvalu Dollars"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TV"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tuvalu"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="TWD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Taiwan, New Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Taiwan"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="TZS"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tanzania, Shillings"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tanzania"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="UAH"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Ukraine, Hryvnia"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="UA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Ukraine"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="UGX"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Uganda, Shillings"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="UG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Uganda"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="USD"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="United States of America, Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="US"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="United States of America"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="UYU"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Uruguay, Pesos"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="UY"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Uruguay"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="UZS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Uzbekistan, Sums"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="UZ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Uzbekistan"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="VEB"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Venezuela, Bolivares"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="VE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Venezuela"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="VND"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Viet Nam, Dong"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="VN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Viet Nam"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="VUV"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Vanuatu, Vatu"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="VU"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Vanuatu"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="WST"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Samoa, Tala"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="WS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Samoa"
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="XAF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Communauté Financière Africaine BEAC, Francs"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="XAG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Silver, Ounces"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="XAU"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Gold, Ounces"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="XCD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="East Caribbean Dollars"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="XDR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="International Monetary Fund, Special Drawing Rights"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="XOF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Communauté Financière Africaine BCEAO, Francs"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="XPD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Palladium Ounces"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="XPF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Comptoirs Français du Pacifique Francs"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 
Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="XPT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Platinum, Ounces"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		
End case 

Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="YER"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Yemen, Rials"
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="YE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Yemen"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="ZAR"
Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="South Africa, Rand"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ZA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="South Africa"
End case 
$_l_CurrentRow:=$_l_CurrentRow+1
CCM_at_CurrencyCodes{$_l_CurrentRow}:="ZWD"

Case of 
	: ($_t_LoadOption="FULL")
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Zimbabwe, Zimbabwe Dollar"
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ZW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Zimbabwe"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ZM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Zambia"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="EH"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Western Sahara"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="WF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Wallis and Futuna"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="British Virgin Islands"
End case 
Case of 
	: ($_t_LoadOption="Country") | ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="UM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="US Minor Outlying Islands"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="VI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="US Virgin Islands"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TC"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Turks & Caicos Islands"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Tokelau"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Togo"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Timor-Leste"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SJ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="SVALBARD AND JAN MAYEN"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="South Georgia"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="SN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Senegal"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="VC"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="St Vincent & the Grenadines"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="St Pierre & Miquelon"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="LC"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="St Lucia"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="St Kits & Nevis"
End case 

Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="RE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Reunion"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Puerto Rico"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PN"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Pitcairn"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Palestenian Territory"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="PW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Palau"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Northern Mariana"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Norfolk Island"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NU"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Niue"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NE"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Niger"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MC"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="New Caledonia"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="NR"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Nauru"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Myanmar"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="FM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Micronesia"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="YT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mayotte"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="YT"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Martinique"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="MH"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Marshall Islands"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="ML"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Mali"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="KI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Kiribati"
End case 

Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="HM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Heard Is & MacDonald Isles"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GW"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guinea-Bissau"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GP"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Guadeloupe"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Grenada"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GL"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Greenland"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GA"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Gabon"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="French Southern Territories"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="French Polynesia"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="French Guiana"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="FO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Faroe Islands"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="GQ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Equatorial Guinea"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="EC"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Ecuador"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="DM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Dominica"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cote D'ivoire"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CK"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cook Islands"
End case 
Case of 
	: ($_t_LoadOption="FULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="COD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Congo Democratic Republic"
		
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Congo Democratic Republic"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CC"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cocos, Keeling Islands"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CX"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Christmas Island"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="TD"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="CHAD"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Central Afican Republic"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="CM"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Cameroon"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BF"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Burkina Faso"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="IO"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="British Indian Ocean Territory"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BV"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Bouvet Island"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="BJ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Benin"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AG"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Antigua & Barbuda"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AQ"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Antarctica"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AI"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Anguilla"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AS"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="American Samoa"
End case 
Case of 
	: ($_t_LoadOption="CountryFULL")
		$_l_CurrentRow:=$_l_CurrentRow+1
		CCM_at_CurrencyCodes{$_l_CurrentRow}:="AX"
		CCM_at_CurrencyNames{$_l_CurrentRow}:="Land Islands"
End case 
ARRAY TEXT:C222(CCM_at_CurrencyCodes; $_l_CurrentRow)
ARRAY TEXT:C222(CCM_at_CurrencyNames; $_l_CurrentRow)
SORT ARRAY:C229(CCM_at_CurrencyNames; CCM_at_CurrencyCodes)
CCM_at_CurrencyNames:=1
ERR_MethodTrackerReturn("CCM_ISOCurrencyCodes"; $_t_oldMethodName)