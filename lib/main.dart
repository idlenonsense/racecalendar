import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'NetworkImageWidget.dart';
import 'models/car_model.dart';
import 'models/pilot_model.dart';
import 'providers/providers.dart';
import 'models/race_model.dart';
import 'repositories/race_repository.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'F1 Календарь 2026',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.red.shade700,
        colorScheme: ColorScheme.light(
          primary: Colors.red.shade700,
          secondary: Colors.red.shade400,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontSize: 20),
          titleSmall: TextStyle(fontSize: 18),
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 16),
          bodySmall: TextStyle(fontSize: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            iconSize: 28,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('F1 Календарь 2026', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.red.shade700,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontSize: 18),
          indicatorWeight: 4,
          tabs: const [
            Tab(text: 'ГОНКИ', icon: Icon(Icons.calendar_today)),
            Tab(text: 'ПИЛОТЫ', icon: Icon(Icons.person)),
            Tab(text: 'БОЛИДЫ', icon: Icon(Icons.directions_car)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep, size: 32),
            onPressed: () async {
              final repo = ProviderScope.containerOf(context).read(raceRepositoryProvider);
              await repo.clearCache();
              ProviderScope.containerOf(context).invalidate(currentSeasonRacesProvider);
              ProviderScope.containerOf(context).read(selectedRaceIdProvider.notifier).state = null;
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Кэш очищен', style: TextStyle(fontSize: 18))),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh, size: 32),
            onPressed: () {
              ProviderScope.containerOf(context).invalidate(currentSeasonRacesProvider);
              ProviderScope.containerOf(context).read(selectedRaceIdProvider.notifier).state = null;
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          CalendarTab(),
          PilotsTab(),
          CarsTab(),
        ],
      ),
    );
  }
}

class CalendarTab extends ConsumerWidget {
  const CalendarTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final racesAsync = ref.watch(currentSeasonRacesProvider);
    final selectedRaceId = ref.watch(selectedRaceIdProvider);

    return racesAsync.when(
      data: (races) {
        if (races.isEmpty) {
          return const Center(child: Text('Нет данных о гонках', style: TextStyle(fontSize: 20)));
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: races.length,
                itemBuilder: (context, index) {
                  final race = races[index];
                  return RaceCard(
                    race: race,
                    isSelected: race.raceId == selectedRaceId,
                    onTap: () => ref.read(selectedRaceIdProvider.notifier).state = race.raceId,
                  );
                },
              ),
            ),
            // Правая панель с деталями
            Expanded(
              flex: 1,
              child: selectedRaceId != null
                  ? RaceDetails(
                raceId: selectedRaceId,
                onClose: () => ref.read(selectedRaceIdProvider.notifier).state = null,
              )
                  : const Center(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    'Выберите гонку для просмотра деталей',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 24),
            Text('Ошибка: $error', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(currentSeasonRacesProvider);
                ref.read(selectedRaceIdProvider.notifier).state = null;
              },
              child: const Text('Повторить', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(strokeWidth: 6),
            SizedBox(height: 24),
            Text('Загрузка календаря...', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}

class RaceCard extends StatelessWidget {
  final RaceModel race;
  final bool isSelected;
  final VoidCallback onTap;

  const RaceCard({
    super.key,
    required this.race,
    this.isSelected = false,
    required this.onTap,
  });

  String _formatDateRange() {
    final schedule = race.schedule;
    final raceDate = schedule.race?.date;

    if (raceDate == null) return 'Даты не определены';

    DateTime startDate = schedule.fp1?.date ?? raceDate;
    DateTime endDate = raceDate;

    final DateFormat formatter = DateFormat('d MMM');
    if (startDate.month == endDate.month) {
      return '${startDate.day}-${formatter.format(endDate)}';
    } else {
      return '${formatter.format(startDate)} - ${formatter.format(endDate)}';
    }
  }

  String _getFlagEmoji(String countryCode) {
    const flags = {
      'Australia': '🇦🇺',
      'Bahrain': '🇧🇭',
      'China': '🇨🇳',
      'Japan': '🇯🇵',
      'Italy': '🇮🇹',
      'Monaco': '🇲🇨',
      'Canada': '🇨🇦',
      'Spain': '🇪🇸',
      'Austria': '🇦🇹',
      'UK': '🇬🇧',
      'Hungary': '🇭🇺',
      'Belgium': '🇧🇪',
      'Netherlands': '🇳🇱',
      'USA': '🇺🇸',
      'Mexico': '🇲🇽',
      'Brazil': '🇧🇷',
      'UAE': '🇦🇪',
      'Qatar': '🇶🇦',
      'Singapore': '🇸🇬',
      'Azerbaijan': '🇦🇿',
    };
    return flags[countryCode] ?? '🏁';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final flagEmoji = _getFlagEmoji(race.circuit.country);

    return Card(
      color: isSelected ? theme.primaryColor.withOpacity(0.1) : Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${race.round}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      race.displayName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(flagEmoji, style: const TextStyle(fontSize: 24, color: Colors.redAccent)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${race.circuit.city}, ${race.circuit.country}',
                            style: const TextStyle(fontSize: 18, color: Colors.black87),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _formatDateRange(),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.map_outlined, size: 48, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RaceDetails extends ConsumerWidget {
  String _getUrlTrack(String countryCode) {
    const urls = {
      'Australia': 'https://izhevsk.ru/forums/icons/forum_pictures/010992/10992048.png',
      'Bahrain': 'https://avatars.mds.yandex.net/i?id=d6a5099b07a50cdf392ad59f9d099a4a_l-5911886-images-thumbs&n=13',
      'China': 'https://images.steamusercontent.com/ugc/1664602132419918403/C966757FD7B1B94408758EA8F3952C9A1180C2B9/',
      'Japan': 'https://i30.fastpic.org/big/2012/0130/11/8107bb86a62c337ce2d4c60a6b1d5a11.jpg',
      'Italy': 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Imola_2009_moto.svg/1280px-Imola_2009_moto.svg.png',
      'Monaco': 'https://www.motorsport-total.com/img/portraet/formel-1/strecken/2016-circuit-de-monaco.png',
      'Canada': 'https://i.ytimg.com/vi/WCsUYgt046Q/maxresdefault.jpg',
      'Spain': 'https://avatars.mds.yandex.net/i?id=c11148004200b5a39f09a2b4d6b0ae25_l-5829296-images-thumbs&n=13',
      'Austria': 'https://images.steamusercontent.com/ugc/1664602132419915949/3FEC088C7311774B3B8650B3DCE357C80F2F511D/',
      'Great Britain': 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Silverstone_Circuit_moto_nat_pits.svg/1280px-Silverstone_Circuit_moto_nat_pits.svg.png',
      'Hungary': 'https://images.steamusercontent.com/ugc/1664602132419919563/B9C70A63727509902184546BD8328516250C7476/',
      'Belgium': 'https://i.pinimg.com/originals/28/bf/d2/28bfd2e3f386007915cf5f241a7072cd.png?nii=t',
      'Netherlands': 'https://i.ytimg.com/vi/gINpwFBZQN0/maxresdefault.jpg',
      'United States': 'https://tickets.moscow/wp-content/uploads/ubs/playground/230/Circuit-of-The-Americas.jpg',
      'Mexico': 'https://images.steamusercontent.com/ugc/1664602132419921369/4D89692C0B4309BF58CA2B691170F4F8A9106A1C/',
      'Brazil': 'https://i.ytimg.com/vi/jyC_WBOiyPg/maxresdefault.jpg',
      'United Arab Emirates': 'https://avatars.mds.yandex.net/i?id=a450a2bee83b1486edc720e0f748de2ad68aec62-5279915-images-thumbs&n=13',
      'Qatar': 'https://photobooth.cdn.sports.ru/preset/news/7/87/6f5bc161241c6be496162e254c208.jpeg?f=webp&q=90&s=2x&w=730',
      'Singapore': 'https://yandex-images.clstorage.net/4QhwX9204/2a3a16rlUo/LqOjw9bdbk5dphnmP959Xt5AvYkZR_4C2nuRhgy-45Bzj8OhN9ytMWxr8_X8as86KYm4LltqAERj6FZthaxOfGH67pCRgylOWLJS7HPEcU7LDKDKDAXnBt0inYNjh5vhBeG6lk-p1kkmb_v0-iqELmTk1WtofGgYG6MlX6j7DRkCpK_m6d4JUVu5VNgu0l1d9QmUigsy4W3wSPzBUYGbxSLmhqlPo_dEL0De4-gG-R5l8-c8dUFYCRWgEFmF0RswGqax9NTUOktol3rdLtt2SeA0toA7BeV32nXf5XW1luU38b-CbK3LUxB8z_bJPuY1W93iKnpqZRMbiSVIuvE0OxemsPXK_jBhSrRA1jbgXXfoN522Bh3BWNl86_RoiLTjNNuXlG2G82QZetDfzQr4BXPB5QdfW0QBBokUeJPnIjg9q5rq4skKdl6cfvkH6U5fzyulvyID3XT3c9jAbJydyQX0t6truvlKG2zi5Pgq6BN_6MUYcEVFOgSXKmCOywkcHpWj2tHUJEtIn3bdLdJ4SecvnaECPONT317f8nSRnOo384avV7zqVB5UwtLoOOUtYf79OFpKfyAXoCdgj9s-Pxegp8f9wixKaJR79jvWb37nF7CCGBDfft9s-PlprZf6BNCPnU6H930Fbd_e6yP9H3vS6DtNeGMKC5cTa5rENjEtrLXA_soNT223Quss4FVCyhS4jTgE71HHXMrxa5mT9S_HmY5-lvtBF2fg6vM67x1a_NkqU31cKCG0OkWr5zg-K5Cx2-3hIm1YkGbrE8ZAQeoslpQVMdJf3VLf1VWPr-oK-5K0S6vmTQt_8t_GNMA9d__rAGNiezIygDp7vMgJDhqOuNHLxQRbdZty2hfhaFbyA6SjOgXTestMwtxpqavZCuSxh2qh0mgQYPHp3BHjDXvCwChYWV8qIJgHRYjDHjwUjoTHyswDTna8WeYH-kFu1B24oAcx-3TKSMXdbL0',
      'Azerbaijan': 'https://f1report.ru/img/fotos/2021/06/f1-1622759639.png',
      'Saudi Arabia': 'https://i.pinimg.com/originals/38/8a/a6/388aa6d7d27cae4db4bc10ac4491452e.png?nii=t',
    };
    return urls[countryCode] ?? '🏁';
  }

  final String raceId;
  final VoidCallback onClose;

  const RaceDetails({super.key, required this.raceId, required this.onClose});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(raceDetailsProvider(raceId));

    return Container(
      padding: const EdgeInsets.all(20),
      child: detailsAsync.when(
        data: (race) {
          if (race == null) {
            return const Center(child: Text('Гонка не найдена', style: TextStyle(fontSize: 20)));
          }
          return _buildContent(context, race);
        },
        error: (error, stack) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
            const SizedBox(height: 24),
            const Text('Детали недоступны оффлайн', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 12),
            Text('$error', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => ref.refresh(raceDetailsProvider(raceId)),
              child: const Text('Повторить', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: onClose,
              icon: const Icon(Icons.close, size: 28),
              label: const Text('Закрыть', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 6)),
      ),
    );
  }

  Widget _buildContent(BuildContext context, RaceModel race) {
    final theme = Theme.of(context);
    final circuit = race.circuit;
    final schedule = race.schedule;
    final url = _getUrlTrack(race.circuit.country);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AsyncImage(
            imageUrl: url,
            placeholderLabel: 'Фото трассы',
            placeholderIcon: Icons.map,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  race.displayName,
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.redAccent),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 32),
                onPressed: onClose,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '${circuit.city}, ${circuit.country}',
            style: theme.textTheme.titleMedium?.copyWith(fontSize: 22, color: Colors.black),
          ),
          const SizedBox(height: 24),
          _buildInfoRow('Длина круга', circuit.circuitLength),
          _buildInfoRow('Повороты', circuit.corners.toString()),
          if (circuit.lapRecord != null)
            _buildInfoRow('Рекорд круга', circuit.lapRecord!),
          if (circuit.firstParticipationYear != null)
            _buildInfoRow('Первый Гран-при', circuit.firstParticipationYear.toString()),
          const Divider(height: 40, thickness: 2),
          Text('Расписание', style: theme.textTheme.titleLarge?.copyWith(fontSize: 26)),
          const SizedBox(height: 16),
          if (schedule.fp1 != null)
            _buildSession('FP1', schedule.fp1!.date),
          if (schedule.fp2 != null)
            _buildSession('FP2', schedule.fp2!.date),
          if (schedule.fp3 != null)
            _buildSession('FP3', schedule.fp3!.date),
          if (schedule.qualy != null)
            _buildSession('Квалификация', schedule.qualy!.date),
          if (schedule.sprintQualy != null)
            _buildSession('Спринт-квалификация', schedule.sprintQualy!.date),
          if (schedule.sprintRace != null)
            _buildSession('Спринт', schedule.sprintRace!.date),
          if (schedule.race != null)
            _buildSession('Гонка', schedule.race!.date),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildSession(String name, DateTime date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(name, style: const TextStyle(fontSize: 18, color: Colors.black))),
          Text(
            DateFormat('dd MMM yyyy').format(date),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
}


class PilotsTab extends ConsumerWidget {
  const PilotsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pilotsAsync = ref.watch(pilotsProvider);
    final selectedId = ref.watch(selectedPilotIdProvider);

    return pilotsAsync.when(
      data: (pilots) {
        if (pilots.isEmpty) {
          return const Center(child: Text('Нет данных о пилотах', style: TextStyle(fontSize: 20)));
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: pilots.length,
                itemBuilder: (context, index) {
                  final pilot = pilots[index];
                  return PilotCard(
                    pilot: pilot,
                    isSelected: pilot.id == selectedId,
                    onTap: () => ref.read(selectedPilotIdProvider.notifier).state = pilot.id,
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: selectedId != null
                  ? PilotDetails(
                pilot: pilots.firstWhere((p) => p.id == selectedId),
                onClose: () => ref.read(selectedPilotIdProvider.notifier).state = null,
              )
                  : const Center(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    'Выберите пилота для просмотра деталей',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      error: (error, _) => Center(child: Text('Ошибка: $error', style: const TextStyle(fontSize: 20))),
      loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 6)),
    );
  }
}

class PilotCard extends StatelessWidget {
  final PilotModel pilot;
  final bool isSelected;
  final VoidCallback onTap;

  const PilotCard({
    super.key,
    required this.pilot,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: isSelected ? theme.primaryColor.withOpacity(0.1) : Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    pilot.number,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pilot.name,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      pilot.team,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pilot.country,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.person, size: 48, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PilotDetails extends StatelessWidget {
  final PilotModel pilot;
  final VoidCallback onClose;

  const PilotDetails({super.key, required this.pilot, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AsyncImage(
              imageUrl: pilot.imageUrl,
              placeholderLabel: 'Фото пилота',
              placeholderIcon: Icons.person,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    pilot.name,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 32),
                  onPressed: onClose,
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Номер', pilot.number),
            _buildInfoRow('Команда', pilot.team),
            _buildInfoRow('Страна', pilot.country),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class CarsTab extends ConsumerWidget {
  const CarsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carsAsync = ref.watch(carsProvider);
    final selectedId = ref.watch(selectedCarIdProvider);

    return carsAsync.when(
      data: (cars) {
        if (cars.isEmpty) {
          return const Center(child: Text('Нет данных о болидах', style: TextStyle(fontSize: 20)));
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final car = cars[index];
                  return CarCard(
                    car: car,
                    isSelected: car.id == selectedId,
                    onTap: () => ref.read(selectedCarIdProvider.notifier).state = car.id,
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: selectedId != null
                  ? CarDetails(
                car: cars.firstWhere((c) => c.id == selectedId),
                onClose: () => ref.read(selectedCarIdProvider.notifier).state = null,
              )
                  : const Center(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    'Выберите болид для просмотра деталей',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      error: (error, _) => Center(child: Text('Ошибка: $error', style: const TextStyle(fontSize: 20))),
      loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 6)),
    );
  }
}

class CarCard extends StatelessWidget {
  final CarModel car;
  final bool isSelected;
  final VoidCallback onTap;

  const CarCard({
    super.key,
    required this.car,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: isSelected ? theme.primaryColor.withOpacity(0.1) : Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.directions_car, size: 48, color: Colors.redAccent),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.team,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      car.model,
                      style: const TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      car.engine,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarDetails extends StatelessWidget {
  final CarModel car;
  final VoidCallback onClose;

  const CarDetails({super.key, required this.car, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AsyncImage(
              imageUrl: car.imageUrl,
              placeholderLabel: 'Фото болида',
              placeholderIcon: Icons.directions_car,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${car.team} ${car.model}',
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.redAccent),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 32),
                  onPressed: onClose,
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Команда', car.team),
            _buildInfoRow('Модель', car.model),
            _buildInfoRow('Двигатель', car.engine),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
}