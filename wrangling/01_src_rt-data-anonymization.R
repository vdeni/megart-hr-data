# remove names from data files, output anonymized files. also deal with column
# specifications on import
library(dplyr)
library(magrittr)
library(conflicted)
library(here)
library(readr)
library(stringr)

# read in data from the first wave
d_wave1 <- readr::read_csv(here::here('data',
                                      '01_dat_r_reaction-times_1.csv'),
                           col_types = cols(ExperimentName = col_character(),
                                            Subject = col_integer(),
                                            Session = col_integer(),
                                            Age = col_integer(),
                                            Chronos.BoxInfo = col_character(),
                                            Clock.Information = col_character(),
                                            DataFile.Basename = col_character(),
                                            Display.RefreshRate =
                                                col_character(),
                                            ExperimentVersion = col_character(),
                                            Group = col_integer(),
                                            Handedness = col_character(),
                                            Name = col_character(),
                                            RandomSeed = col_character(),
                                            RuntimeCapabilities =
                                                col_character(),
                                            RuntimeVersion = col_character(),
                                            RuntimeVersionExpected =
                                                col_character(),
                                            SessionDate = col_character(),
                                            SessionStartDateTimeUtc =
                                                col_character(),
                                            SessionTime = col_character(),
                                            Sex = col_character(),
                                            StudioVersion = col_character(),
                                            Block = col_integer(),
                                            AB = col_character(),
                                            MegaBlok = col_integer(),
                                            MegaBlok.Cycle = col_integer(),
                                            MegaBlok.Sample = col_integer(),
                                            `Procedure[Block]` = col_character(),
                                            `Running[Block]` = col_character(),
                                            Trial = col_integer(),
                                            Blok = col_character(),
                                            KojiBlokAB = col_integer(),
                                            KojiBlokAB.Cycle = col_integer(),
                                            KojiBlokAB.Sample = col_integer(),
                                            KojiBlokBA = col_character(),
                                            KojiBlokBA.Cycle = col_character(),
                                            KojiBlokBA.Sample = col_character(),
                                            Kraj.DEVICE = col_character(),
                                            `Procedure[Trial]` = col_character(),
                                            `Running[Trial]` = col_character(),
                                            Uputa.DEVICE = col_character(),
                                            SubTrial = col_integer(),
                                            BlokA = col_integer(),
                                            BlokA.Cycle = col_integer(),
                                            BlokA.Sample = col_integer(),
                                            BlokB = col_character(),
                                            BlokB.Cycle = col_character(),
                                            BlokB.Sample = col_character(),
                                            DisplayAcc.DEVICE = col_character(),
                                            KojiBlokA12345 = col_character(),
                                            KojiBlokB12345 = col_character(),
                                            KreniKadHoces.DEVICE =
                                                col_character(),
                                            `OverallAcc[SubTrial]` =
                                                col_double(),
                                            `Procedure[SubTrial]` =
                                                col_character(),
                                            `Running[SubTrial]` =
                                                col_character(),
                                            LogLevel5 = col_character(),
                                            ListaA1 = col_integer(),
                                            ListaA1.Cycle = col_integer(),
                                            ListaA1.Sample = col_integer(),
                                            ListaA2 = col_character(),
                                            ListaA2.Cycle = col_character(),
                                            ListaA2.Sample = col_character(),
                                            ListaA3 = col_character(),
                                            ListaA3.Cycle = col_character(),
                                            ListaA3.Sample = col_character(),
                                            ListaA4 = col_character(),
                                            ListaA4.Cycle = col_character(),
                                            ListaA4.Sample = col_character(),
                                            ListaA5 = col_character(),
                                            ListaA5.Cycle = col_character(),
                                            ListaA5.Sample = col_character(),
                                            ListaB1 = col_character(),
                                            ListaB1.Cycle = col_character(),
                                            ListaB1.Sample = col_character(),
                                            ListaB2 = col_character(),
                                            ListaB2.Cycle = col_character(),
                                            ListaB2.Sample = col_character(),
                                            ListaB3 = col_character(),
                                            ListaB3.Cycle = col_character(),
                                            ListaB3.Sample = col_character(),
                                            ListaB4 = col_character(),
                                            ListaB4.Cycle = col_character(),
                                            ListaB4.Sample = col_character(),
                                            ListaB5 = col_character(),
                                            ListaB5.Cycle = col_character(),
                                            ListaB5.Sample = col_character(),
                                            MaliBlok = col_integer(),
                                            `OverallAcc[LogLevel5]` =
                                                col_double(),
                                            Podrazaj.ACC = col_logical(),
                                            Podrazaj.CRESP = col_integer(),
                                            Podrazaj.DEVICE = col_character(),
                                            Podrazaj.DurationError =
                                                col_character(),
                                            Podrazaj.OnsetDelay =
                                                col_character(),
                                            Podrazaj.OnsetTime = col_double(),
                                            Podrazaj.OnsetToOnsetTime =
                                                col_double(),
                                            Podrazaj.RESP = col_integer(),
                                            Podrazaj.RT = col_double(),
                                            Podrazaj.RTTime = col_double(),
                                            `Procedure[LogLevel5]` =
                                                col_character(),
                                            Rijec = col_character(),
                                            `Running[LogLevel5]` =
                                                col_character(),
                                            TO = col_integer(),
                                            VrstaRijeci = col_character()))

# read in data from the second wave
d_wave2 <- readr::read_csv(here::here('data',
                                      '02_dat_r_reaction-times_2.csv'),
                            col_types = cols(ExperimentName = col_character(),
                                             Subject = col_integer(),
                                             Session = col_integer(),
                                             Age = col_integer(),
                                             Chronos.BoxInfo = col_character(),
                                             Clock.Information =
                                                 col_character(),
                                             DataFile.Basename =
                                                 col_character(),
                                             Display.RefreshRate =
                                                 col_character(),
                                             ExperimentVersion =
                                                 col_character(),
                                             Group = col_integer(),
                                             Handedness = col_character(),
                                             Name = col_character(),
                                             RandomSeed = col_character(),
                                             RuntimeCapabilities =
                                                 col_character(),
                                             RuntimeVersion = col_character(),
                                             RuntimeVersionExpected =
                                                 col_character(),
                                             SessionDate = col_character(),
                                             SessionStartDateTimeUtc =
                                                 col_character(),
                                             SessionTime = col_character(),
                                             Sex = col_character(),
                                             StudioVersion = col_character(),
                                             Block = col_integer(),
                                             AB = col_character(),
                                             MegaBlok = col_integer(),
                                             MegaBlok.Cycle = col_integer(),
                                             MegaBlok.Sample = col_integer(),
                                             `Procedure[Block]` =
                                                 col_character(),
                                             `Running[Block]` = col_character(),
                                             Trial = col_integer(),
                                             Blok = col_character(),
                                             KojiBlokAB = col_integer(),
                                             KojiBlokAB.Cycle = col_integer(),
                                             KojiBlokAB.Sample = col_integer(),
                                             KojiBlokBA = col_character(),
                                             KojiBlokBA.Cycle = col_character(),
                                             KojiBlokBA.Sample =
                                                 col_character(),
                                             Kraj.DEVICE = col_character(),
                                             `Procedure[Trial]` =
                                                 col_character(),
                                             `Running[Trial]` = col_character(),
                                             Uputa.DEVICE = col_character(),
                                             SubTrial = col_integer(),
                                             BlokA = col_integer(),
                                             BlokA.Cycle = col_integer(),
                                             BlokA.Sample = col_integer(),
                                             BlokB = col_character(),
                                             BlokB.Cycle = col_character(),
                                             BlokB.Sample = col_character(),
                                             DisplayAcc.DEVICE = col_character(),
                                             KojiBlokA12345 = col_character(),
                                             KojiBlokB12345 = col_character(),
                                             KreniKadHoces.DEVICE =
                                                 col_character(),
                                             `OverallAcc[SubTrial]` =
                                                 col_double(),
                                             `Procedure[SubTrial]` =
                                                 col_character(),
                                             `Running[SubTrial]` =
                                                 col_character(),
                                             LogLevel5 = col_character(),
                                             ListaA1 = col_integer(),
                                             ListaA1.Cycle = col_integer(),
                                             ListaA1.Sample = col_integer(),
                                             ListaA2 = col_character(),
                                             ListaA2.Cycle = col_character(),
                                             ListaA2.Sample = col_character(),
                                             ListaA3 = col_character(),
                                             ListaA3.Cycle = col_character(),
                                             ListaA3.Sample = col_character(),
                                             ListaA4 = col_character(),
                                             ListaA4.Cycle = col_character(),
                                             ListaA4.Sample = col_character(),
                                             ListaA5 = col_character(),
                                             ListaA5.Cycle = col_character(),
                                             ListaA5.Sample = col_character(),
                                             ListaA6 = col_character(),
                                             ListaA6.Cycle = col_character(),
                                             ListaA6.Sample = col_character(),
                                             ListaA7 = col_character(),
                                             ListaA7.Cycle = col_character(),
                                             ListaA7.Sample = col_character(),
                                             ListaA8 = col_character(),
                                             ListaA8.Cycle = col_character(),
                                             ListaA8.Sample = col_character(),
                                             ListaB1 = col_character(),
                                             ListaB1.Cycle = col_character(),
                                             ListaB1.Sample = col_character(),
                                             ListaB2 = col_character(),
                                             ListaB2.Cycle = col_character(),
                                             ListaB2.Sample = col_character(),
                                             ListaB3 = col_character(),
                                             ListaB3.Cycle = col_character(),
                                             ListaB3.Sample = col_character(),
                                             ListaB4 = col_character(),
                                             ListaB4.Cycle = col_character(),
                                             ListaB4.Sample = col_character(),
                                             ListaB5 = col_character(),
                                             ListaB5.Cycle = col_character(),
                                             ListaB5.Sample = col_character(),
                                             ListaB6 = col_character(),
                                             ListaB6.Cycle = col_character(),
                                             ListaB6.Sample = col_character(),
                                             ListaB7 = col_character(),
                                             ListaB7.Cycle = col_character(),
                                             ListaB7.Sample = col_character(),
                                             ListaB8 = col_character(),
                                             ListaB8.Cycle = col_character(),
                                             ListaB8.Sample = col_character(),
                                             MaliBlok = col_integer(),
                                             `OverallAcc[LogLevel5]` =
                                                 col_double(),
                                             Podrazaj.ACC = col_logical(),
                                             Podrazaj.CRESP = col_integer(),
                                             Podrazaj.DEVICE = col_character(),
                                             Podrazaj.DurationError =
                                                 col_character(),
                                             Podrazaj.OnsetDelay =
                                                 col_character(),
                                             Podrazaj.OnsetTime = col_double(),
                                             Podrazaj.OnsetToOnsetTime =
                                                 col_double(),
                                             Podrazaj.RESP = col_integer(),
                                             Podrazaj.RT = col_double(),
                                             Podrazaj.RTTime = col_double(),
                                             `Procedure[LogLevel5]` =
                                                 col_character(),
                                             Rijec = col_character(),
                                             `Running[LogLevel5]` =
                                                 col_character(),
                                             TO = col_integer(),
                                             VrstaRijeci = col_character()),
                    na = c('', 'na', 'NULL'))

# normalize participant names
d_wave1$Name %<>% stringr::str_to_lower(.) %>%
    stringr::str_trim(.) %>%
    chartr('šđčćž', 'sdccz', x = .)

d_wave2$Name %<>% stringr::str_to_lower(.) %>%
    stringr::str_trim(.) %>%
    chartr('šđčćž', 'sdccz', x = .)

# create aliases for participants
d_wave1_aliases <- paste0('A_',
                          sprintf(fmt = '%02i',
                                  1:(length(unique(d_wave1$Name))-1)))

d_wave2_aliases <- paste0('B_',
                          sprintf(fmt = '%02i',
                                  1:(length(unique(d_wave2$Name))-1)))

# replace names with aliases
d_wave1 %<>%
    dplyr::group_by(.,
                    Name) %>%
    tidyr::nest(.) %>%
    # exclude subject with invalid data
    {.[-2, ]}

d_wave1$Name <- d_wave1_aliases

d_wave1 %<>% tidyr::unnest(.,
                           cols = 'data')

d_wave2 %<>% group_by(.,
                      Name) %>%
    tidyr::nest(.) %>%
    # exclude subject with invalid data
    {.[-3, ]}

d_wave2$Name <- d_wave2_aliases

d_wave2 %<>% tidyr::unnest(.,
                           cols = 'data')

# write out
readr::write_csv(d_wave1, here::here('data',
                                     '03_dat_c_reaction-times_1.csv'))
readr::write_csv(d_wave2, here::here('data',
                                     '04_dat_c_reaction-times_2.csv'))
