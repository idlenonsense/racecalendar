import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/car_model.dart';
import '../models/pilot_model.dart';
import '../models/race_model.dart';
import '../repositories/race_repository.dart';
import '../models/race_model.dart' as models;

part 'providers.g.dart';

@riverpod
Future<List<models.RaceModel>> currentSeasonRaces(CurrentSeasonRacesRef ref) {
  final repository = ref.watch(raceRepositoryProvider);
  return repository.getCurrentSeasonRaces();
}

final pilotsProvider = FutureProvider<List<PilotModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return [
    PilotModel(id: '1', name: 'Кими Антонелли', team: 'Mercedes', number: '12', country: 'Италия', imageUrl: 'https://www.aljazeera.com/wp-content/uploads/2026/03/AFP__20260329__A63K77W__v1__HighRes__AutoPrixF1Jpn-1774767404.jpg?resize=1920%2C1440'),
    PilotModel(id: '2', name: 'Джордж Расселл', team: 'Mercedes', number: '63', country: 'Великобритания', imageUrl: 'https://i.ytimg.com/vi/oIgdY41J39I/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGH8gHihIMA8=&amp;rs=AOn4CLDpdihpM9DnsRgwj27b_kzsYHliJQ'),
    PilotModel(id: '3', name: 'Шарль Леклер', team: 'Ferrari', number: '16', country: 'Монако', imageUrl: 'https://sportandbets.com/upload/resize_cache/iblock/8e1/768_433_2/9m43ye70tl1gl1elmfqo10b7q54trz17.webp'),
    PilotModel(id: '4', name: 'Льюис Хэмильтон', team: 'Ferrari', number: '44', country: 'Великобритания', imageUrl: 'https://s.yimg.com/ny/api/res/1.2/LFVvJldv3XhgDwc4VYGWpQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyNDI7aD04Mjg7Y2Y9d2VicA--/https://media.zenfs.com/en/the_independent_577/b5fea61effcce310319eeacf56662766'),
    PilotModel(id: '5', name: 'Ландо Норрис', team: 'McLaren', number: '1', country: 'Великобритания', imageUrl: 'https://photobooth.cdn.sports.ru/preset/message/b/32/76709bdde4c45bf3738d23ce8ef5f.jpeg?f=webp&q=90&s=2x&w=730'),
    PilotModel(id: '6', name: 'Оскар Пиастри', team: 'McLaren', number: '81', country: 'Австралия', imageUrl: 'https://autosport.com.ru/files/styles/896x504/public/news/2026/05/03/147533-77ecbf09-16c0-4821-acac-2fe45354e42a.jpg?itok=_S7KH1S4'),
    PilotModel(id: '7', name: 'Оливер Берман', team: 'Haas', number: '87', country: 'Великобритания', imageUrl: 'https://autosport.com.ru/files/news/2024/09/16/136387-28906a95-ca9f-4d20-a870-c98242718e5d.jpg'),
    PilotModel(id: '8', name: 'Пьер Гасли', team: 'Alpine', number: '10', country: 'Монако', imageUrl: 'https://cdnn21.img.ria.ru/images/07e9/04/12/2012147911_0:43:3074:1772_1920x0_80_0_0_181f4a4bda6096f61140b90db9af30c2.jpg'),
    PilotModel(id: '9', name: 'Макс Ферстаппен', team: 'Red Bull Racing', number: '3', country: 'Нидерланды', imageUrl: 'https://img.championat.com/s/1200x630/news/big/z/g/foto-maks-ferstappen-pokazal-shlem-dlya-uchastiya-v-formule-1-v-sezone-2026_17691683272075487000.jpg'),
    PilotModel(id: '10', name: 'Лиам Лоусон', team: 'Racing Bulls', number: '30', country: 'Австралия', imageUrl: 'https://yandex-images.clstorage.net/MZfy95403/a4e684fo9ya4/_dlPq5MJ7EJBcLTxz7UQc-7uRTO7B8qhjNkSR4NM1VlOpXH4pkVBzPcWvXH7GcEI_bonxXGXYy6MxPqHyRJSnbkMSw_TOazTZeF11f61wKfeLyAXW0M_gSzZMuRlLuJuLUKi_6Gi9j0yg31hv9h1fK5ZhuPk1sGcKPYYoV1GlShdi7xqdVpcIvVAtcKslDHUDEwFRMljmKMYPxUGNB9gzExhc__x8jf-08Cccn_-xL-9KfFABAbyLuk0W8NPhwU7nMuv-LZrXvFGw8Zjn6QC1D1eliZ4sQhA2W025oe9oTw_0MGuYzHlnsPRr7H8rKU9T1kDcNT1Qwz7ZYvBbWd3Gl76HRjlmiyBp8P2wi_UwHQ9XZZGG8EZcYosdMfWz5BPnpETbUMTBU7S8z5yr85m737qwZIU94FsqBdL4h8VRttsKm4bpWlvUDTT15M_FxGFjq0H5jiAWhNpLnT09l4QLY0Qox0hQlYNk8A8AUw9NX7diFJRVOTT3clHugOfBHSpzThOehd5brHkkIST_8dTZ49fJMc6w3gTqJ12VJQOAr6880DdcPH3TNECrxM_TPVMXfgzgsUlYx3ZFRrTfrUnm80Kzbhmq8yDVXOHk7xlYWfMnsTnG6B4sOpdZQY3jrFMzEAj_mDwVA_wg04ArA2Wzzy6goDG9gDu6_ZJAkwUVrptqExKdLhcYHQxVpAdVdOWjIxENEoDCsN7TYWlR5wjLQ0yMuxw0uaMw6AOM21dlX88KKOS5OXRjKn1OVCNBKc6DPkcWgcKLGHWAKSST6fTpV4fZyQ68xpDSo7mxsTNwt7doEOMUXPkbPLTHXGPPAUNTbsjQwZXER3LxpixfFfliX5Jryn0S21h9QOHcR_EQ7afjKYl6pMK8vp81bWmLaMvT5LjPmPiRj5AgS1R3M_2D52aUYLmBALcWRfpwmzEd2mOO566hzl-k-VRZDHfhYLVLiwmVakwCPOYX7a10'),
    PilotModel(id: '11', name: 'Эрвид Линдблад', team: 'Racing Bulls', number: '41', country: 'Великобритания', imageUrl: 'https://www.sports.ru/dynamic_images/news/111/699/755/9/share/c1a76e_no_logo_no_text.jpg'),
    PilotModel(id: '12', name: 'Габриэль Бортолето', team: 'Audi', number: '5', country: 'Бразилия', imageUrl: 'https://img.championat.com/s/1350x900/news/big/y/p/bortoleto-vyskazalsya-o-pervom-v-karere-vystuplenii-za-zavodskuyu-komandu_1768945423932783925.jpg'),
    PilotModel(id: '13', name: 'Айзек Хаджар', team: 'Red Bull Racing', number: '6', country: 'Франция', imageUrl: 'https://bookmaker-ratings.ru/wp-content/uploads/2024/11/Isak-Hadzhar.jpg'),
    PilotModel(id: '14', name: 'Карлос Сайнц', team: 'Williams', number: '55', country: 'Испания', imageUrl: 'https://s-cdn.sportbox.ru/images/styles/upload/fp_fotos/3f/1e/e72bdffcf208efde07430a5d40cf23e265070a509d53b005023104.jpg'),
    PilotModel(id: '15', name: 'Эстебан Окон', team: 'Haas', number: '31', country: 'Франция', imageUrl: 'https://yandex-images.clstorage.net/MZfy95403/a4e684fo9ya4/_dlPq5MJ7EJBcLTxz7UQc-7uRTO7B8qhjNkSUrPZdSk-hXGdduXh7OLWmKTrCaRI6M9nhcTyUwuZ1182TCJyndmNi9-yjDmGAJX0cf_lMaY631T2G0IbBakc9tImOSVpPUOjzyHzli-AAe-zD8yEvb379gFl5KC62jdr0c72VsoO2B8oV1gu4ZVDl4EOdZBmLY11B2iQeCD6jtZ1BA3DTt8Skk2DkrX-gFG_cswtx1yuO9CwpvfQzXnXu-J8N5SJbMreuESZbvIHgKaD3cYTFYy-RTRooWqzmD8E5efMkW0_oTCMc-EETNHDfKCsPdZvbbiC0SQFoD9JB0hTXiXFWW7oPsplW19A59NX8a0nEyUtDjX2yKFps_hcdPTWn9AvHvBCvQBARZ4S415AfCz0_q7r4BL2NBP9q8dKkT52t5lNmkz7pGmPM-STpLJ8tAMEfB72JzkSmSJYfzW3tHzSLy3Q0z1iU8QuYoEPEz9tx_zdCBNBZ5dxbmiHWcOPF-dorBpdydbInROFIbSznWRAV3zeJmXbE2sBeX12lbS9YS2NsoMv8WInzaLQvLJ-LwVvz3tigVUXAQ-7FphzTwe1yHz77JrkyK-QR1BmEa_Vo1R8nYRX21Cq4VlcFZUX_6E-3xEDnAMSlK6BwL0RPQ6EjtzoI-LWdkO-uRVLELw1VputyU3rxWgNEbVCdYFM9OGFfzy05SoQuGGKDbbnZG6x3nxhEQ5i0-a_k9Cfo749p87vKXPhZnbRn6s3WMHed1Xr_whdGkUJXEGlMcfxTVbQd31uRuUZwitCmn1G9-Rfcr0f4kDvkQN0zvPxPqFeDNTdrcsScRQHQh961eoBTxVmSh75Dlj2e-zy1sKGsE1101SePiV1CgO4g5utJudV74CObICgjmCRRm5Bw68DDL6G7Y2Y4YIW12NtuzW5Eo6Htztt6Z3KFouew0Wx9KO_ZYG33v5ktGmyGAPr7oXlU'),
    PilotModel(id: '16', name: 'Франко Колапинто', team: 'Alpine', number: '43', country: 'Аргентина', imageUrl: 'https://f1report.ru/img/newsf1/2026/02/618720121356.png'),
    PilotModel(id: '17', name: 'Нико Хулькенберг', team: 'Audi', number: '27', country: 'Германия', imageUrl: 'https://s0.rbk.ru/v6_top_pics/media/img/6/72/347141226921726.webp'),
    PilotModel(id: '18', name: 'Александр Альбон', team: 'Williams', number: '23', country: 'Тайланд', imageUrl: 'https://avatars.mds.yandex.net/i?id=14023690f1184500f58aeeefd4df7831_l-9708671-images-thumbs&n=13'),
    PilotModel(id: '19', name: 'Вальтери Боттас', team: 'Cadillac', number: '77', country: 'Финляндия', imageUrl: 'https://static.wikia.nocookie.net/racing-cars/images/a/a3/Valtteri-bottas-p3-british-grand-prix-planetf1.jpg/revision/latest?cb=20210825091539'),
    PilotModel(id: '20', name: 'Серхио Перес', team: 'Cadillac', number: '11', country: 'Мексика', imageUrl: 'https://www.autoracing1.com/wp-content/uploads/2024/f1/imola/perez-worried.jpg'),
    PilotModel(id: '21', name: 'Фернандо Алонсо', team: 'Aston Martin', number: '14', country: 'Испания', imageUrl: 'https://f1report.ru/img/newsf1/2026/05/303106084033.jpg'),
    PilotModel(id: '22', name: 'Лэнс Стролл', team: 'Aston Martin', number: '18', country: 'Канада', imageUrl: 'https://img.championat.com/ranker/17306690601578673068.jpg'),
  ];
});

final carsProvider = FutureProvider<List<CarModel>>((ref) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return [
    CarModel(id: 'me', team: 'Mercedes', model: 'W17', engine: 'Mercedes', imageUrl: 'https://avatars.mds.yandex.net/i?id=4eed2a1f721dbc281037d29f76481935_l-3536247-images-thumbs&n=13'),
    CarModel(id: 'fe', team: 'Ferrari', model: 'SF-26', engine: 'Ferrari', imageUrl: 'https://i.ytimg.com/vi/QxUZN_m065k/maxresdefault.jpg'),
    CarModel(id: 'mc', team: 'McLaren', model: 'MCL40', engine: 'Mercedes', imageUrl: 'https://yandex-images.clstorage.net/MZfy95403/a4e684fo9ya4/_dlPq5MJ7EJBcLTxz7UQc-7uRTO7B8qhjNxnsoOJ1XlrJTGdZvAxmffD3TR-OeEdyKoXtQHiNhuJtPqHyUJCvYkMO-53eewTBcAQMG90EScvOnRnmpeK1BwZFCRkzuJf_ENzT0FChUyyc91war21Dg5ecUAlJYG_uIXoAl2lx2n-e75YFIkdg6QAB2JOhWL1TB8n9bowqOD6PvZ1VUxAPt-Scx8Rg0at8ZLOsEwMdh1-KdKg9RYzfnrGihCcNdSovmgsmyWLzjAnc6ZRfrZixF6MRURooEshqB0WxveNsE1uICKN0lEmveChDTMebfTvDtvicAanEWwrFogyfEf1ao_azMjU-b7RJ0MH4Q50wsRdjCUnGLF6culfN5eFvMPsL_LhrfCx9qzCMM5gfK4m3r0ZALAEZXE_WdarQA52NFhfqc-IJ7pvQjdiVvHNpTN3rR2FBFnyGJHrXwS3FDyh_65Ckc-h4rXt8TK9g4_9t33fisPwFzfAXgknSsAfREb5TYmuOje7jpJ0MVYxHefRdl8-pAYa0BhQWF2k1UQuMs5NoVGeEkP0rzOhr_D-PYX9r-sQYdaHAE5bh5ohrhd0-X8KbEvlGbwjlzJWcr_V0TWe3oQnedC7EphO9nbEncC-_sJyjhPgt46yQLxjv14GnO1aEmIF5PN8uNRLEw9mVVndi55Z9olfAtXjVdOPZyB1jF5XdtqiyIOIrlUG1g-hf4zTYJ4xUjS9kQCPou9dtpx_ewBAFjWRPrukGdIfl9U4jNuOKkT5XqDkEVeBfWcTpx99RwYqskiyS802hYfuUq8eogC_kFDUjOITzUCOzcTt7PvRoqT1AFyIBfgjTNVmSjxo_dkFuF6D5zK00R73AGaMvEbWSqL5Arn-Rednj6M9LAKyjQHyhj6wI-0TfT7GPc2JEEL35sHOWXSLM99HhrpOWW6qd6usk7XR9BFfNmPXLDw2lemg-GCanUWV0'),
    CarModel(id: 'ha', team: 'Haas', model: 'VF-26', engine: 'Ferrari', imageUrl: 'https://i.ebayimg.com/images/g/KmAAAeSwEb5pg8G2/s-l1600.jpg'),
    CarModel(id: 'al', team: 'Alpine', model: 'A526', engine: 'Mercedes', imageUrl: 'https://s.yimg.com/os/en/motorsport_articles_445/594623ac1848da6107a90a81f4509085'),
    CarModel(id: 'rbr', team: 'Red Bull Racing', model: 'RB22', engine: 'Red Bull Ford', imageUrl: 'https://i.ytimg.com/vi/AXgZuqzFvOE/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGBMgTSh_MA8=&rs=AOn4CLAjd1mhQnTSrvIS_SWEtO-O34_mqw'),
    CarModel(id: 'rb', team: 'Racing Bulls', model: 'VCARB 03', engine: 'Red Bull Ford', imageUrl: 'https://www.assettocorsamods.org/wp-content/uploads/2026/03/Screenshot_gp_2026_vcarb03_ks_barcelona_5-1-126-14-55-23-2048x857.jpg'),
    CarModel(id: 'au', team: 'Audi', model: 'R26', engine: 'Audi', imageUrl: 'https://emea-dam.audi.com/adobe/assets/urn:aaid:aem:2c434b2d-fd1c-4f3e-be3f-465c55188395/as/F1-25_Beauty_9077-L.jpg'),
    CarModel(id: 'wl', team: 'Williams', model: 'FW48', engine: 'Mercedes', imageUrl: 'https://i.ytimg.com/vi/sjwW5xGCyI4/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGFYgWChlMA8=&amp;rs=AOn4CLCbawXE9OOlb9xB3f1pZi0l_fS52w'),
    CarModel(id: 'ca', team: 'Cadillac', model: 'MAC-26', engine: 'Ferrari', imageUrl: 'https://s.yimg.com/ny/api/res/1.2/PH7pIl8QRFgBw3EmAH9tWQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTY0MDtjZj13ZWJw/https://media.zenfs.com/en/motorsport_articles_445/69316b6a7f8461a0820a3045df6e5abe'),
    CarModel(id: 'am', team: 'Aston Martin', model: 'RA626H', engine: 'Honda', imageUrl: 'https://img.championat.com/s/1200x630/news/big/a/e/prezentaciya-komandy-f-1-aston-martin-na-2026-j_1770666945623527958.jpg'),
  ];
});

final selectedPilotIdProvider = StateProvider<String?>((ref) => null);
final selectedCarIdProvider = StateProvider<String?>((ref) => null);
final selectedRaceIdProvider = StateProvider<String?>((ref) => null);
final raceDetailsProvider = FutureProvider.autoDispose.family<RaceModel?, String>((ref, raceId) async {
  final repo = ref.read(raceRepositoryProvider);
  return await repo.getRaceByID(raceId);
});



