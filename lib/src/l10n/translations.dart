import 'package:get/get.dart' as getx;

import 'translation_keys.dart';

class Translations extends getx.Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return <String, Map<String, String>>{
      'en_US': <String, String>{
        // common
        trCommonCancel: 'Cancel',
        trCommonSave: 'Save',
        trCommonOk: 'Ok',
        trCommonClear: 'Clear',
        trCommonSearch: 'Search',
        ptrCommonDuration: '@hours h @minutes m',
        ptrCommonHours: '@hours h',
        ptrCommonMinutes: '@minutes m',
        ptrCommonReviews: '@count reviews',
        trCommonOther: 'Other',


        // genre
        trGenreAll: 'All',
        trGenreSciFi: 'Sci-Fi',
        trGenreComedy: 'Comedy',
        trGenreFamily: 'Family',
        trGenreAdventure: 'Adventure',
        trGenreDrama: 'Drama',
        trGenreThriller: 'Thriller',
        trGenreMystery: 'Mystery',
        trGenreTvSeries: 'TV Series',
        trGenreAnimation: 'Animation',
        trGenreAction: 'Action',
        trGenreFantasy: 'Fantasy',
        trGenreRomance: 'Romance',
        trGenreHorror: 'Horror',
        trGenreCrime: 'Crime',
        trGenreRealityTV: 'Reality TV',
        trGenreDocumentary: 'Documentary',
        trGenreSport: 'Sport',
        trGenreShort: 'Short',
        trGenreAnime: 'Anime',
        trGenreHistory: 'History',
        trGenreMusical: 'Musical',
        trGenreWestern: 'Western',
        trGenreBiography: 'Biography',
        trGenreMusic: 'Music',
        trGenreWar: 'War',
        trGenreAdult: 'Adult',
        trGenreAuto: 'Auto',


        // quality
        trQualityMedium: 'Medium',
        trQualityHigh: 'High',


        // language
        trLanguageGeo: 'Georgian',
        trLanguageEng: 'English',
        trLanguageRus: 'Russian',
        trLanguageJpn: 'Japanese',
        trLanguageFre: 'French',
        trLanguageGer: 'German',
        trLanguageKor: 'Korean',
        trLanguageSpa: 'Spanish',
        trLanguagePor: 'Portuguese',


        // bottom nav
        trBottomNavHome: 'Home',
        trBottomNavFavorites: 'Favorites',
        trBottomNavStatistics: 'Statistics',


        // home
        trHomeHeaderSearch: 'Movies, Actors, Directors',
        trHomeHeaderWatchLater: 'Continue Watching',
        trHomeWatchLaterLeftAt: 'Left at',
        trHomeHeaderTopSelection: 'Top Selection',
        trHomeHeaderMovies: 'Movies',


        // favorites
        trFavoritesOptionSeeAll: 'See All',
        trFavoritesOptionGroups: 'Groups',
        ptrFavoritesHeaderDeleteGroup: 'Delete group @groupName ?',
        ptrFavoritesContentDeleteGroup: 'Group @groupName will be deleted, as well as its movies',
        trFavoritesHeaderAddGroup: 'Add Group',
        trFavoritesAddGroupHintNameField: 'Name',
        trFavoritesNoMovieHeader: 'No movie has been added.',
        trFavoritesClick: 'Click',
        trFavoritesNoMoviesMessageEnd: 'in details page to save',


        // statistics
        trStatisticsMovieWatched: 'Movies Watched',
        trStatisticsTVSeriesWatched: 'TV Series Watched',
        trStatisticsEpisodesWatched: 'Episodes Watched',
        trStatisticsOptionYear: 'This Year',
        trStatisticsOptionMonth: 'This Month',
        trStatisticsOptionWeek: 'This Week',
        trStatisticsAverageTime: 'Average Time',
        trStatisticsHeaderMovieGenres: 'Watched Movie Genres',


        // search
        trSearchFieldHint: 'Search movies...',


        // movie group
        trMovieGroupButtonAddMovie: 'Add Movie',


        // add movie
        trAddMovieHintSearchField: 'Search...',
        trAddMovieButtonAdd: 'Add',
        trAddMovieButtonRemove: 'Remove',


        // settings
        trSettingsHeaderLanguage: 'Language',
        trSettingsChangeLanguage: 'Change language',
        trSettingsChangeLanguageDialogHeader: 'Language',
        trSettingsHeaderVideoPlayer: 'Video Player',
        trSettingsAutoplay: 'Autoplay',
        trSettingsCommentAutoplay: 'Start video automatically when loaded',
        trSettingsDoubleTapToSeek: 'Double tap to seek',
        ptrSettingsCommentDoubleTapToSeek: '@value seconds',
        trSettingsDoubleTapToSeekDialogHeader: 'Double tap to seek',
        ptrSettingsDoubleTapToSeekDialogItem: '@seconds sec',
        trSettingsSaveMovieInterval: 'Save movie interval',
        ptrSettingsCommentSaveMovieInterval: 'Every @seconds seconds\ncurrently playing movie position will update',
        trSettingsSaveMovieIntervalDialogHeader: 'Save Movie Interval',
        ptrSettingsSaveMovieIntervalDialogItem: '@seconds sec',
        trSettingsHeaderHistory: 'History',
        trSettingsClearSearchHistory: 'Clear search history',
        trSettingsCommentClearSearchHistory: 'Clear saved movies present in search page',
        trSettingsClearSearchHistoryDialogHeader: 'Clear search history?',
        trSettingsClearSearchHistoryDialogContent: "Deleted history can't be restored\nConfirm to delete.",
        trSettingsClearSavedMovies: 'Clear saved movies',
        trSettingsCommentClearSavedMovies: 'Delete saved movies from "Continue Watching"',
        trSettingsClearSavedMoviesDialogHeader: 'Clear saved movies?',
        trSettingsClearSavedMoviesDialogContent: "Deleted movies can't be restored.\nConfirm to delete.",
        trSettingsRecordSearchHistory: 'Record search history',
        trSettingsRecordWatchHistory: 'Record watch history',
        trSettingsClearFavorites: 'Clear favorites',
        trSettingsCommentClearFavorites: 'Clear movies from "Favorites" page',
        trSettingsClearFavoritesDialogHeader: 'Clear favorite movies?',
        trSettingsClearFavoritesDialogContent: 'Delete all favorite movies, but retain movie groups',
        trSettingsClearFavoritesDialogClearGroups: 'Clear groups',
        trSettingsHeaderCache: 'Cache',
        trSettingsClearCache: 'Clear cache',
        trSettingsCommentClearCache: 'Clear cached movies and seasons',
        trSettingsClearCacheDialogHeader: 'Clear cache?',
        trSettingsClearCacheDialogContent: 'The action will delete all the cached movies and seasons',


        // details
        trDetailsHeaderCast: 'Cast',
        trDetailsButtonContinue: 'Continue',
        trDetailsOptionNoGroup: 'No Group',


        // stream
        trStreamHeaderRecommended: 'Recommended',
        trStreamSettingsHeaderQuality: 'Quality',
        trStreamSettingsHeaderLanguage: 'Language',
        trStreamSettingsHeaderPlaybackSpeed: 'Playback speed',
        trStreamSettingsHeaderZoom: 'Zoom',
        trStreamSettingsHeaderSubtitles: 'Subtitles',
        trStreamSettingsButtonImportSubtitles: 'Import subtitles',
        trStreamSettingsHeaderSubtitlesOffset: 'Subtitle offset',
        trStreamSettingsHeaderSubtitleTextSize: 'Subtitle text size',
        trStreamSettingsHeaderSubtitleSpacingFromBottom: 'Subtitle spacing from progress',
        trStreamSettingsHeaderSubtitleTextColor: 'Subtitle text color',
        trStreamSettingsHeaderSubtitleBorderThickness: 'Subtitle border thickness',
        trStreamSettingsHeaderSubtitleBorderColor: 'Subtitle border color',
        ptrStreamSeason: 'Season @season',
        ptrStreamEpisode: 'Episode @episode',
        ptrStreamEp: 'Ep @episode',
      },
      'ka_GE': <String, String>{
        // common
        trCommonCancel: 'გაუქმება',
        trCommonSave: 'შენახვა',
        trCommonOk: 'კარგი',
        trCommonClear: 'წაშლა',
        trCommonSearch: 'ძებნა',
        ptrCommonDuration: '@hours სთ @minutes წთ',
        ptrCommonHours: '@hours სთ',
        ptrCommonMinutes: '@minutes წთ',
        ptrCommonReviews: '@count მნახველი',
        trCommonOther: 'სხვა',


        // genre
        trGenreAll: 'ყველა',
        trGenreSciFi: 'ფანტასტიკა',
        trGenreComedy: 'კომედია',
        trGenreFamily: 'საოჯახო',
        trGenreAdventure: 'სათავგადასავლო',
        trGenreDrama: 'დრამა',
        trGenreThriller: 'თრილერი',
        trGenreMystery: 'მისტიკა',
        trGenreTvSeries: 'სერიალი',
        trGenreAnimation: 'ანიმაციური',
        trGenreAction: 'მძაფრ-სიუჟეტიანი',
        trGenreFantasy: 'ზღაპრული (ფენტეზი)',
        trGenreRomance: 'მელოდრამა',
        trGenreHorror: 'საშინელებათა',
        trGenreCrime: 'დეტექტივი',
        trGenreRealityTV: 'Reality TV',
        trGenreDocumentary: 'დოკუმენტური',
        trGenreSport: 'სპორტული',
        trGenreShort: 'მოკლემეტრაჟიანი',
        trGenreAnime: 'ანიმე',
        trGenreHistory: 'ისტორიული',
        trGenreMusical: 'მიუზიკლი',
        trGenreWestern: 'ვესტერნი',
        trGenreBiography: 'ბიოგრაფიული',
        trGenreMusic: 'მუსიკა',
        trGenreWar: 'საომარი',
        trGenreAdult: 'ეროტიკული',
        trGenreAuto: 'ავტო',


        // quality
        trQualityMedium: 'საშუალო',
        trQualityHigh: 'მაღალი',


        // language
        trLanguageGeo: 'ქართული',
        trLanguageEng: 'ინგლისური',
        trLanguageRus: 'რუსული',
        trLanguageJpn: 'იაპორნური',
        trLanguageFre: 'ფრანგული',
        trLanguageGer: 'გერმანული',
        trLanguageKor: 'კორეული',
        trLanguageSpa: 'ესპანური',
        trLanguagePor: 'პორტუგალიური',


        // bottom nav
        trBottomNavHome: 'Home',
        trBottomNavFavorites: 'Favorites',
        trBottomNavStatistics: 'Statistics',


        // home
        trHomeHeaderSearch: 'ფილმები, მსახიობები, რეჟისორები',
        trHomeHeaderWatchLater: 'გააგრძელეთ ყურება',
        trHomeWatchLaterLeftAt: 'შეჩერდა',
        trHomeHeaderTopSelection: 'ტოპ ფილმები',
        trHomeHeaderMovies: 'ფილმები',


        // favorites
        trFavoritesOptionSeeAll: 'ყველას ნახვა',
        trFavoritesOptionGroups: 'ჯგუფები',
        ptrFavoritesHeaderDeleteGroup: 'წაიშალოს @groupName ?',
        ptrFavoritesContentDeleteGroup: 'ჯგუფი @groupName წაიშლება, ისევე როგორც მისი ფილმები',
        trFavoritesHeaderAddGroup: 'ჯგუფის დამატება',
        trFavoritesAddGroupHintNameField: 'სახელი',
        trFavoritesNoMovieHeader: 'არცერთი ფილმი არ დამატებულა',
        trFavoritesClick: 'დააჭირეთ',
        trFavoritesNoMoviesMessageEnd: 'დეტალების გვერდზე რომ შეინახოთ',


        // statistics
        trStatisticsMovieWatched: 'ნაყურები ფილმები',
        trStatisticsTVSeriesWatched: 'ნაყურები სერიები',
        trStatisticsEpisodesWatched: 'ნაყურები სერიალები',
        trStatisticsOptionYear: 'წელი',
        trStatisticsOptionMonth: 'თვე',
        trStatisticsOptionWeek: 'კვირა',
        trStatisticsAverageTime: 'საშუალო დრო',
        trStatisticsHeaderMovieGenres: 'ფილმის ჟანრები',


        // search
        trSearchFieldHint: 'ფილმის ძებნა...',


        // movie group
        trMovieGroupButtonAddMovie: 'ფილმის დამატება',


        // add movie
        trAddMovieHintSearchField: 'ძებნა...',
        trAddMovieButtonAdd: 'დამატება',
        trAddMovieButtonRemove: 'წაშლა',


        // settings
        trSettingsHeaderLanguage: 'ენა',
        trSettingsChangeLanguage: 'ენის შეცვლა',
        trSettingsChangeLanguageDialogHeader: 'ენა',
        trSettingsHeaderVideoPlayer: 'ვიდეო ფლეიერი',
        trSettingsAutoplay: 'ავტომატური დაკვრა',
        trSettingsCommentAutoplay: 'ვიდეოს ავტომატურად დაკვრა, როდესაც ჩაიტვირთება',
        trSettingsDoubleTapToSeek: 'გადახვევა ორჯერ დაჭერით',
        ptrSettingsCommentDoubleTapToSeek: '@value წამი',
        trSettingsDoubleTapToSeekDialogHeader: 'გადახვევა ორჯერ დაჭერით',
        ptrSettingsDoubleTapToSeekDialogItem: '@seconds წამი',
        trSettingsSaveMovieInterval: 'ფილმის შენახვის ინტერვალი',
        ptrSettingsCommentSaveMovieInterval: 'ყოველ @seconds წამში\nმოცემულ მომენტში დაკრული ფილმის პოზიცია განახლდება',
        trSettingsSaveMovieIntervalDialogHeader: 'ფილმის შენახვის ინტევალი',
        ptrSettingsSaveMovieIntervalDialogItem: '@seconds წამი',
        trSettingsHeaderHistory: 'ისტორია',
        trSettingsClearSearchHistory: 'ძიების ისტორიის წაშლა',
        trSettingsCommentClearSearchHistory: 'გაასუფთავეთ ისტორია ძიების გვერდზე',
        trSettingsClearSearchHistoryDialogHeader: 'ძიების ისტორიის წაშლა',
        trSettingsClearSearchHistoryDialogContent: 'წაშლილი ისტორია ვერ აღდგება\nდაადასტურეთ რომ წაიშალოს.',
        trSettingsClearSavedMovies: 'შენახული ფილმების წაშლა',
        trSettingsCommentClearSavedMovies: 'ფილმების გასუფთავება "გააგრძელეთ ყურებიდან"',
        trSettingsClearSavedMoviesDialogHeader: 'შენახული ფილმების წაშლა',
        trSettingsClearSavedMoviesDialogContent: 'წაშლილი ფილმები ვერ აღდგება.\nდაადასტურეთ რომ წაიშალოს.',
        trSettingsRecordSearchHistory: 'ძიების ისტორიის ჩაწერა',
        trSettingsRecordWatchHistory: 'ნახვის ისტორიის ჩაწერა',
        trSettingsClearFavorites: 'ფავორიტების წაშლა',
        trSettingsCommentClearFavorites: 'ფილმების წაშლა "ფავორიტების" გვერდიდან',
        trSettingsClearFavoritesDialogHeader: 'ფავორიტების წაშლა',
        trSettingsClearFavoritesDialogContent: 'წაიშლება ფავორიტები, მაგრამ დარჩება ჯგუფები',
        trSettingsClearFavoritesDialogClearGroups: 'ჯგუფების წაშლა',
        trSettingsHeaderCache: 'ქეში',
        trSettingsClearCache: 'ქეშის წაშლა',
        trSettingsCommentClearCache: 'წაშლის დაქეშილ ფილმებსა და სეზონებს',
        trSettingsClearCacheDialogHeader: 'ქეშის წაშლა',
        trSettingsClearCacheDialogContent: 'მოქმედება წაშლის სისტემაში ყველა დაქეშილ ფილმებსა და სეზონებს',


        // details
        trDetailsHeaderCast: 'მსახიობები',
        trDetailsButtonContinue: 'გაგრძელება',
        trDetailsOptionNoGroup: 'ჯგუფის გარეშე',


        // stream
        trStreamHeaderRecommended: 'რეკომენდირებული',
        trStreamSettingsHeaderQuality: 'ხარისხი',
        trStreamSettingsHeaderLanguage: 'ენა',
        trStreamSettingsHeaderPlaybackSpeed: 'დაკვრის სიჩქარე',
        trStreamSettingsHeaderZoom: 'ზომა',
        trStreamSettingsHeaderSubtitles: 'სუბტიტრები',
        trStreamSettingsButtonImportSubtitles: 'სუბტიტრების შემოტანა',
        trStreamSettingsHeaderSubtitlesOffset: 'სუბტიტრების გადაადგილება',
        trStreamSettingsHeaderSubtitleTextSize: 'სუბტიტრების ტექსტის ზომა',
        trStreamSettingsHeaderSubtitleSpacingFromBottom: 'სუბტიტრების დაშორება პროგრესიდან',
        trStreamSettingsHeaderSubtitleTextColor: 'სუბტიტრების ტექსტის ფერი',
        trStreamSettingsHeaderSubtitleBorderThickness: 'სუბტიტრების საზღვრის სისქე',
        trStreamSettingsHeaderSubtitleBorderColor: 'სუბტიტრების საზღვრის ფერი',
        ptrStreamSeason: 'სეზონი @season',
        ptrStreamEpisode: 'ეპიზოდი @episode',
        ptrStreamEp: 'ეპ @episode',
      },
    };
  }
}
