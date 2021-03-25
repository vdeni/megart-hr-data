# import anonymized reaction time data, and clean it
library(dplyr)
library(magrittr)
library(conflicted)
library(here)
library(janitor)
library(readr)
library(stringr)

# read in data from the first wave
d_wave1 <- readr::read_csv(here::here('data',
                                      '03_dat_c_reaction-times_1.csv'),
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
                                      '04_dat_c_reaction-times_2.csv'),
                           col_types = cols(ExperimentName = col_character(),
                                            Subject = col_integer(),
                                            Session = col_integer(),
                                            Age = col_integer(),
                                            Chronos.BoxInfo = col_character(),
                                            Clock.Information = col_character(),
                                            DataFile.Basename =
                                                col_character(),
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
                           na = c('', 'na', 'NA'))

# clean variable names; convert to snake_case
d_wave1 %<>%
    janitor::clean_names(.)

d_wave2 %<>%
    janitor::clean_names(.)

# translate variable names to english
# wave 1
d_wave1 %<>%
    dplyr::rename(.,
                  'stimulus_rt' = podrazaj_rt,
                  'string' = rijec,
                  'block_no' = block,
                  'block_name' = blok,
                  'block_order' = ab,
                  'id' = name,
                  'string_type' = vrsta_rijeci)

names(d_wave1) %<>%
    stringr::str_replace_all(.,
                             'podrazaj', 'stimulus') %>%
    stringr::str_replace_all(.,
                             'koji', 'which') %>%
    stringr::str_replace_all(.,
                             'blok', 'block') %>%
    stringr::str_replace_all(.,
                             'lista', 'list')

d_wave1 %<>%
    dplyr::rename(.,
                  'end_device' = kraj_device,
                  'instructions_device' = uputa_device,
                  'go_when_ready_device' = kreni_kad_hoces_device,
                  'corect_response' = to,
                  'small_block' = mali_block)

# translate variable values to english
# sex
d_wave1$sex <- dplyr::case_when(d_wave1$sex == 'Ž' ~ 'f',
                                d_wave1$sex == 'M' ~ 'm')

# string type
d_wave1$string_type <- dplyr::case_when(d_wave1$string_type == 'pseudorijec' ~
                                           'pseudoword',
                                        d_wave1$string_type == 'rijec' ~
                                           'word')

# handedness
d_wave1$handedness <- dplyr::case_when(d_wave1$handedness == 'desna' ~ 'right',
                                       d_wave1$handedness == 'lijeva' ~ 'left')

# block order
d_wave1$block_order %<>%
    stringr::str_replace(.,
                         'pa', 'then')

# wave 2
d_wave2 %<>%
    dplyr::rename(.,
                  'stimulus_rt' = podrazaj_rt,
                  'string' = rijec,
                  'block_no' = block,
                  'block_name' = blok,
                  'block_order' = ab,
                  'id' = name,
                  'string_type' = vrsta_rijeci)

names(d_wave2) %<>%
    stringr::str_replace_all(.,
                             'podrazaj', 'stimulus') %>%
    stringr::str_replace_all(.,
                             'koji', 'which') %>%
    stringr::str_replace_all(.,
                             'blok', 'block') %>%
    stringr::str_replace_all(.,
                             'lista', 'list')

d_wave2 %<>%
    dplyr::rename(.,
                  'end_device' = kraj_device,
                  'instructions_device' = uputa_device,
                  'go_when_ready_device' = kreni_kad_hoces_device,
                  'corect_response' = to,
                  'small_block' = mali_block)

# translate sex to english
d_wave2$sex <- dplyr::case_when(d_wave2$sex == 'Ž' ~ 'f',
                                d_wave2$sex == 'M' ~ 'm')

# translate string type to english
d_wave2$string_type <- dplyr::case_when(d_wave2$string_type == 'pseudoriječ' ~
                                           'pseudoword',
                                        d_wave2$string_type == 'riječ' ~
                                           'word')

# translate handedness to english
d_wave2$handedness <- dplyr::case_when(d_wave2$handedness == 'desna' ~ 'right',
                                       d_wave2$handedness == 'lijeva' ~ 'left')

# translate block order to english
d_wave2$block_order %<>%
    stringr::str_replace(.,
                         'pa', 'then')

# remove data from second session for participants whose 2nd session data is
# incomplete (wave 2)
.id_exc <- dplyr::group_by(d_wave2, id) %>%
    tidyr::nest(.) %>%
    dplyr::mutate_at(.,
                     vars(data),
                     ~purrr::map_int(., nrow)) %>%
    dplyr::filter(.,
                  data == 1321) %>%
    dplyr::pull(.,
                id)

d_wave2 %<>%
    dplyr::filter(.,
                  !(id == .id_exc & session == 2))

# overwrite anonymized data with clean data
readr::write_csv(d_wave1, here::here('data',
                                     '03_dat_c_reaction-times_1.csv'))
readr::write_csv(d_wave2, here::here('data',
                                     '04_dat_c_reaction-times_2.csv'))
