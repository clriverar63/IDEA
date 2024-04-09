 library(shiny)
library(dplyr)

server<- function(input, output) {
  
  ## Selection function
  sel <- function(input.area,input.ethn,input.lows ){
  
    # Typing dataset (not reading so it can be run with electron)
    areaV <-c("166400 - Ararimu ( Auckland )" , "166400 - Ararimu ( Auckland )" , "121400 - Bayview West ( Auckland )" , "121400 - Bayview West ( Auckland )" , "125200 - Birkenhead West ( Auckland )" , "125200 - Birkenhead West ( Auckland )" , "166300 - Bombay Hills ( Auckland )" , "166300 - Bombay Hills ( Auckland )" ,
            "149700 - Bucklands Beach South ( Auckland )" , "149700 - Bucklands Beach South ( Auckland )" , "159700 - Clendon Park East ( Auckland )" , "159700 - Clendon Park East ( Auckland )" , "153400 - Cockle Bay ( Auckland )" , "153400 - Cockle Bay ( Auckland )" , "156100 - Dannemora North ( Auckland )" , "156100 - Dannemora North ( Auckland )" , "156600 - Dannemora South ( Auckland )" , 
            "156600 - Dannemora South ( Auckland )" , "154100 - Dingwall ( Auckland )" , "154100 - Dingwall ( Auckland )" , "164600 - Drury Rural ( Auckland )" , "164600 - Drury Rural ( Auckland )" , "156300 - East Tamaki Heights ( Auckland )" , "156300 - East Tamaki Heights ( Auckland )" , "137100 - Glenavon ( Auckland )" , "137100 - Glenavon ( Auckland )" , "162400 - Glenbrook ( Auckland )" , "162400 - Glenbrook ( Auckland )" , "129500 - Glendene South ( Auckland )" , 
            "129500 - Glendene South ( Auckland )" , "116100 - Kumeu Rural East ( Auckland )" , "116100 - Kumeu Rural East ( Auckland )" , "139600 - Lynfield North ( Auckland )" , "139600 - Lynfield North ( Auckland )" , "146800 - Mangere Bridge ( Auckland )" , "146800 - Mangere Bridge ( Auckland )" , "146100 - Mangere Bridge Ambury ( Auckland )" , "146100 - Mangere Bridge Ambury ( Auckland )" , "151000 - Mangere South ( Auckland )" , "151000 - Mangere South ( Auckland )" ,
            "152800 - Mangere South East ( Auckland )" , "152800 - Mangere South East ( Auckland )" , "139700 - Mount Roskill North ( Auckland )" , "139700 - Mount Roskill North ( Auckland )" , "139800 - Mount Roskill White Swan ( Auckland )" , "139800 - Mount Roskill White Swan ( Auckland )" , "115300 - Muriwai Valley-Bethells Beach ( Auckland )" , "115300 - Muriwai Valley-Bethells Beach ( Auckland )" , "153700 - Northpark North ( Auckland )" , "153700 - Northpark North ( Auckland )" , 
            "150300 - Otahuhu North ( Auckland )" , "150300 - Otahuhu North ( Auckland )" , "151900 - Otahuhu South ( Auckland )" , "151900 - Otahuhu South ( Auckland )" , "149800 - Pakuranga Central ( Auckland )" , "149800 - Pakuranga Central ( Auckland )" , "154900 - Papatoetoe Central ( Auckland )" , "154900 - Papatoetoe Central ( Auckland )" , "155900 - Papatoetoe South West ( Auckland )" , "155900 - Papatoetoe South West ( Auckland )" , 
            "163800 - Patumahoe ( Auckland )" , "163800 - Patumahoe ( Auckland )" , "157000 - Puhinui East ( Auckland )" , "157000 - Puhinui East ( Auckland )" , "165000 - Puni ( Auckland )" , "165000 - Puni ( Auckland )" , "161000 - Randwick Park East ( Auckland )" , "161000 - Randwick Park East ( Auckland )" , "142600 - Royal Oak West (Auckland) ( Auckland )" , "142600 - Royal Oak West (Auckland) ( Auckland )" , "121300 - Sunnynook North ( Auckland )" , "121300 - Sunnynook North ( Auckland )" , "162100 - Takanini South ( Auckland )" , "162100 - Takanini South ( Auckland )" , 
            "157100 - Turanga ( Auckland )" , "157100 - Turanga ( Auckland )" , "318900 - Avonhead West ( Canterbury )" , "318900 - Avonhead West ( Canterbury )" , "318300 - Burnside Park ( Canterbury )" , "318300 - Burnside Park ( Canterbury )" , "334400 - Halkett ( Canterbury )" , "334400 - Halkett ( Canterbury )" , "320700 - Ilam South ( Canterbury )" , "320700 - Ilam South ( Canterbury )" , "317400 - Northwood ( Canterbury )" , "317400 - Northwood ( Canterbury )" , "320100 - Papanui West ( Canterbury )" , "320100 - Papanui West ( Canterbury )" , "324400 - Riccarton South ( Canterbury )" , 
            "324400 - Riccarton South ( Canterbury )" , "325900 - Richmond North (Christchurch City) ( Canterbury )" , "325900 - Richmond North (Christchurch City) ( Canterbury )" , "335400 - Southbridge ( Canterbury )" , "335400 - Southbridge ( Canterbury )" , "332700 - Sumner ( Canterbury )" , "332700 - Sumner ( Canterbury )" , "335600 - Trents ( Canterbury )" , "335600 - Trents ( Canterbury )" , "324100 - Wigram East ( Canterbury )" , "324100 - Wigram East ( Canterbury )" , "323600 - Wigram South ( Canterbury )" , "323600 - Wigram South ( Canterbury )" , "331100 - Woolston East ( Canterbury )" , "331100 - Woolston East ( Canterbury )" , 
            "156900 - Baverstock ( Auckland )" , "156900 - Baverstock ( Auckland )" , "157800 - Mission Heights North ( Auckland )" , "157800 - Mission Heights North ( Auckland )" , "158200 - Mission Heights South ( Auckland )" , "158200 - Mission Heights South ( Auckland )" , "157300 - Ormiston North ( Auckland )" , "157300 - Ormiston North ( Auckland )" , "158100 - Ormiston South ( Auckland )" , "158100 - Ormiston South ( Auckland )" , "135100 - Symonds Street North West ( Auckland )" , "135100 - Symonds Street North West ( Auckland )" , "166400 - Ararimu ( Auckland )" , "166400 - Ararimu ( Auckland )" , "121400 - Bayview West ( Auckland )" ,
            "121400 - Bayview West ( Auckland )" , "125200 - Birkenhead West ( Auckland )" , "125200 - Birkenhead West ( Auckland )" , "166300 - Bombay Hills ( Auckland )" , "166300 - Bombay Hills ( Auckland )" , "149700 - Bucklands Beach South ( Auckland )" , "149700 - Bucklands Beach South ( Auckland )" , "159700 - Clendon Park East ( Auckland )" , "159700 - Clendon Park East ( Auckland )" , "153400 - Cockle Bay ( Auckland )" , "153400 - Cockle Bay ( Auckland )" , "156100 - Dannemora North ( Auckland )" , "156100 - Dannemora North ( Auckland )" , "156600 - Dannemora South ( Auckland )" , "156600 - Dannemora South ( Auckland )" , "154100 - Dingwall ( Auckland )" , "154100 - Dingwall ( Auckland )" , "164600 - Drury Rural ( Auckland )" , 
            "164600 - Drury Rural ( Auckland )" , "156300 - East Tamaki Heights ( Auckland )" , "156300 - East Tamaki Heights ( Auckland )" , "137100 - Glenavon ( Auckland )" , "137100 - Glenavon ( Auckland )" , "162400 - Glenbrook ( Auckland )" , "162400 - Glenbrook ( Auckland )" , "129500 - Glendene South ( Auckland )" , "129500 - Glendene South ( Auckland )" , "116100 - Kumeu Rural East ( Auckland )" , "116100 - Kumeu Rural East ( Auckland )" , "139600 - Lynfield North ( Auckland )" , "139600 - Lynfield North ( Auckland )" , "146800 - Mangere Bridge ( Auckland )" , "146800 - Mangere Bridge ( Auckland )" , "146100 - Mangere Bridge Ambury ( Auckland )" , "146100 - Mangere Bridge Ambury ( Auckland )" , "151000 - Mangere South ( Auckland )" , "151000 - Mangere South ( Auckland )" , "152800 - Mangere South East ( Auckland )" , 
            "152800 - Mangere South East ( Auckland )" , "139700 - Mount Roskill North ( Auckland )" , "139700 - Mount Roskill North ( Auckland )" , "139800 - Mount Roskill White Swan ( Auckland )" , "139800 - Mount Roskill White Swan ( Auckland )" , "115300 - Muriwai Valley-Bethells Beach ( Auckland )" , "115300 - Muriwai Valley-Bethells Beach ( Auckland )" , "153700 - Northpark North ( Auckland )" , "153700 - Northpark North ( Auckland )" , "150300 - Otahuhu North ( Auckland )" , "150300 - Otahuhu North ( Auckland )" , "151900 - Otahuhu South ( Auckland )" , "151900 - Otahuhu South ( Auckland )" , "149800 - Pakuranga Central ( Auckland )" , "149800 - Pakuranga Central ( Auckland )" , "154900 - Papatoetoe Central ( Auckland )" , "154900 - Papatoetoe Central ( Auckland )" , "155900 - Papatoetoe South West ( Auckland )" , "155900 - Papatoetoe South West ( Auckland )" , "163800 - Patumahoe ( Auckland )" , "163800 - Patumahoe ( Auckland )" , "157000 - Puhinui East ( Auckland )" , 
            "157000 - Puhinui East ( Auckland )" , "165000 - Puni ( Auckland )" , "165000 - Puni ( Auckland )" , "161000 - Randwick Park East ( Auckland )" , "161000 - Randwick Park East ( Auckland )" , "142600 - Royal Oak West (Auckland) ( Auckland )" , "142600 - Royal Oak West (Auckland) ( Auckland )" , "121300 - Sunnynook North ( Auckland )" , "121300 - Sunnynook North ( Auckland )" , "162100 - Takanini South ( Auckland )" , "162100 - Takanini South ( Auckland )" , "157100 - Turanga ( Auckland )" , "157100 - Turanga ( Auckland )" , "318900 - Avonhead West ( Canterbury )" , "318900 - Avonhead West ( Canterbury )" , "318300 - Burnside Park ( Canterbury )" , "318300 - Burnside Park ( Canterbury )" , "334400 - Halkett ( Canterbury )" , "334400 - Halkett ( Canterbury )" , "320700 - Ilam South ( Canterbury )" , "320700 - Ilam South ( Canterbury )" , "317400 - Northwood ( Canterbury )" , "317400 - Northwood ( Canterbury )" , "320100 - Papanui West ( Canterbury )" , "320100 - Papanui West ( Canterbury )" , "324400 - Riccarton South ( Canterbury )" , "324400 - Riccarton South ( Canterbury )" , "325900 - Richmond North (Christchurch City) ( Canterbury )" , "325900 - Richmond North (Christchurch City) ( Canterbury )" , "335400 - Southbridge ( Canterbury )" , "335400 - Southbridge ( Canterbury )" , "332700 - Sumner ( Canterbury )" , "332700 - Sumner ( Canterbury )" , "335600 - Trents ( Canterbury )" , "335600 - Trents ( Canterbury )" , "324100 - Wigram East ( Canterbury )" , "324100 - Wigram East ( Canterbury )" , 
            "323600 - Wigram South ( Canterbury )" , "323600 - Wigram South ( Canterbury )" ,
            "331100 - Woolston East ( Canterbury )" , "331100 - Woolston East ( Canterbury )" , "156900 - Baverstock ( Auckland )" , "156900 - Baverstock ( Auckland )" , "157800 - Mission Heights North ( Auckland )" , 
            "157800 - Mission Heights North ( Auckland )" , "158200 - Mission Heights South ( Auckland )" , "158200 - Mission Heights South ( Auckland )" , "157300 - Ormiston North ( Auckland )" , "157300 - Ormiston North ( Auckland )" , "158100 - Ormiston South ( Auckland )" , "158100 - Ormiston South ( Auckland )" , "135100 - Symonds Street North West ( Auckland )" , "135100 - Symonds Street North West ( Auckland )")
  
  districtV <- c('Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Canterbury' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland' , 'Auckland')
  low.scoreV <- c('1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0' , '0')
  low.scoreV <- case_when(low.scoreV==0~ 'Score more than 7', TRUE~ 'Score 7 or less')
  ethnicV    <- c('1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0' , '1' , '0')
  ethnicV <- case_when(ethnicV==0~ 'Chinese or Indian', TRUE~ 'Paheka/European')
  probV   <- c('0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '1' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '0.3' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '1' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.5' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.15' , '0.5' , '0.5' , '0.5' , '0.5' , '0.5' , '0.5' , '0.5' , '0.5' , '0.5' , '0.5' , '0.5' , '0.5' , '0.5')
  
  # rebuilding the dataset
  df <- data.frame(  'Area'=areaV, Score=low.scoreV,  'Ethnicity'= ethnicV, prob=probV)
  
  # randomization probability
  probi <-   as.numeric(df[df$Area==input.area&
                df$Score==input.lows&
                df$Ethnicity==input.ethn,]$prob) 
  
  # Random seed so that is does not generate all the rr's so correlated (problem detected by project manager). 
  set.seed(runif(1, 0, 100000))
  
  
  rr <-  runif(100, 0,1)[round(runif(1, 1,100), 0)]
  
  if((rr<=probi)&input.lows=='Score 7 or less'){
    text1 <- 'Selected & Score 7 or less'}
  
  if((rr>probi)&input.lows=='Score 7 or less'){
    text1 <- 'Not Selected & Score 7 or less'}
  
  if((rr<=probi)&input.lows=='Score more than 7'){
    text1 <- 'Selected & Score more than 7'}
  
  if((rr>probi)&input.lows=='Score more than 7'){
    text1 <- 'Not Selected & Score more than 7'}
  
  text2 <- paste('(',round(rr, 4),'vs', probi, ')', sep='')
  
  # printing rr to check if the 'update' actually works
  sl<- ifelse(rr<=probi, 'SELECTED', 'NO SELECTED')
  paste(sl,': ', text1, '[', text2, ']', sep='')
  
  }
  
  # output when update is clicked on 
  randomVals <- eventReactive(input$button, {
    sel(input$area,input$ethnicity,input$low_score )
  })
  
  output$ex_out <- renderPrint({
    randomVals()  })
  
  
}

 


ui<-fluidPage(
  title = 'Selectize examples',
  sidebarLayout( 
    sidebarPanel(actionButton("button", "Update"),
      selectInput(
        'area', 'Area', choices = 
          c('166400 - Ararimu ( Auckland )', '121400 - Bayview West ( Auckland )', '125200 - Birkenhead West ( Auckland )', '166300 - Bombay Hills ( Auckland )', '149700 - Bucklands Beach South ( Auckland )', '159700 - Clendon Park East ( Auckland )', '153400 - Cockle Bay ( Auckland )', '156100 - Dannemora North ( Auckland )', '156600 - Dannemora South ( Auckland )', '154100 - Dingwall ( Auckland )', '164600 - Drury Rural ( Auckland )', '156300 - East Tamaki Heights ( Auckland )', '137100 - Glenavon ( Auckland )', '162400 - Glenbrook ( Auckland )', '129500 - Glendene South ( Auckland )', '116100 - Kumeu Rural East ( Auckland )', '139600 - Lynfield North ( Auckland )', '146800 - Mangere Bridge ( Auckland )', '146100 - Mangere Bridge Ambury ( Auckland )', '151000 - Mangere South ( Auckland )', '152800 - Mangere South East ( Auckland )', '139700 - Mount Roskill North ( Auckland )', '139800 - Mount Roskill White Swan ( Auckland )', '115300 - Muriwai Valley-Bethells Beach ( Auckland )', '153700 - Northpark North ( Auckland )', '150300 - Otahuhu North ( Auckland )', '151900 - Otahuhu South ( Auckland )', '149800 - Pakuranga Central ( Auckland )', '154900 - Papatoetoe Central ( Auckland )', '155900 - Papatoetoe South West ( Auckland )', '163800 - Patumahoe ( Auckland )', '157000 - Puhinui East ( Auckland )', '165000 - Puni ( Auckland )', '161000 - Randwick Park East ( Auckland )', '142600 - Royal Oak West (Auckland) ( Auckland )', '121300 - Sunnynook North ( Auckland )', '162100 - Takanini South ( Auckland )', '157100 - Turanga ( Auckland )', '318900 - Avonhead West ( Canterbury )', '318300 - Burnside Park ( Canterbury )', '334400 - Halkett ( Canterbury )', '320700 - Ilam South ( Canterbury )', '317400 - Northwood ( Canterbury )', '320100 - Papanui West ( Canterbury )', '324400 - Riccarton South ( Canterbury )', '325900 - Richmond North (Christchurch City) ( Canterbury )', '335400 - Southbridge ( Canterbury )', '332700 - Sumner ( Canterbury )', '335600 - Trents ( Canterbury )', '324100 - Wigram East ( Canterbury )', '323600 - Wigram South ( Canterbury )', '331100 - Woolston East ( Canterbury )', '156900 - Baverstock ( Auckland )', '157800 - Mission Heights North ( Auckland )', '158200 - Mission Heights South ( Auckland )', '157300 - Ormiston North ( Auckland )', '158100 - Ormiston South ( Auckland )', '135100 - Symonds Street North West ( Auckland )')
      ),
      selectizeInput(
        'ethnicity', 'Ethnicity', choices = c("Paheka/European" ,  "Chinese or Indian")
      ),
      
      selectizeInput(
        'low_score', 'Score', choices =c("Score 7 or less" ,  "Score more than 7") 
      )), 
    
    mainPanel(
      helpText('Selection:'),
      verbatimTextOutput('ex_out')  
    )
    
  )
)




shinyApp(ui, server)

 
