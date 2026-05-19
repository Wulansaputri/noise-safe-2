import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
|--------------------------------------------------------------------------
| AVATAR SERVICE - NOISE SAFE
|--------------------------------------------------------------------------
| Service untuk menyimpan dan mengambil avatar dari SharedPreferences
|--------------------------------------------------------------------------
*/

class AvatarService {
  static const String avatarKey = "user_avatar";

  static Future<void> setDefaultAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(avatarKey) == null) {
      await prefs.setString(avatarKey, "assets/avatars/avatar1.png");
      print("✅ Default avatar saved");
    }
  }

  static Future<String> getAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(avatarKey) ?? "assets/avatars/avatar1.png";
  }

  static Future<void> saveAvatar(String avatar) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(avatarKey, avatar);
    print("📸 Avatar saved: $avatar");
  }
}

// INI PENTING: AvatarSelectionScreen harus ada di file yang sama
class AvatarSelectionScreen extends StatefulWidget {
  final String currentAvatar;

  const AvatarSelectionScreen({
    super.key,
    required this.currentAvatar,
  });

  @override
  State<AvatarSelectionScreen> createState() =>
      _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState
    extends State<AvatarSelectionScreen> {

  late String selectedAvatar;

  final List<String> avatarList = [

    "assets/avatars/avatar1.png",
    "assets/avatars/avatar2.png",
    "assets/avatars/avatar3.png",
    "assets/avatars/avatar4.png",
    "assets/avatars/avatar5.png",
    "assets/avatars/avatar6.png",
  ];

  @override
  void initState() {
    super.initState();

    selectedAvatar = widget.currentAvatar;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(

        elevation: 0,

        backgroundColor: Colors.transparent,

        centerTitle: true,

        iconTheme: const IconThemeData(
          color: Color(0xFF4E6E81),
        ),

        title: const Text(

          "Pilih Avatar",

          style: TextStyle(
            color: Color(0xFF4E6E81),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 10),

          Container(

            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(

              gradient: const LinearGradient(

                colors: [
                  Color(0xFFDDEAF2),
                  Color(0xFFF2DCEB),
                ],

                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

              borderRadius: BorderRadius.circular(24),
            ),

            child: Column(
              children: [

                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage:
                        AssetImage(selectedAvatar),
                  ),
                ),

                const SizedBox(height: 14),

                const Text(

                  "Avatar Aktif",

                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4E6E81),
                  ),
                ),

                const SizedBox(height: 5),

                const Text(

                  "Pilih avatar yang paling cocok untuk profilmu",

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Expanded(

            child: GridView.builder(

              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              itemCount: avatarList.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 3,

                crossAxisSpacing: 18,

                mainAxisSpacing: 18,
              ),

              itemBuilder: (context, index) {

                final avatar = avatarList[index];

                final isSelected =
                    selectedAvatar == avatar;

                return GestureDetector(

                  onTap: () {

                    setState(() {

                      selectedAvatar = avatar;
                    });
                  },

                  child: AnimatedContainer(

                    duration:
                        const Duration(milliseconds: 250),

                    padding: const EdgeInsets.all(5),

                    decoration: BoxDecoration(

                      borderRadius:
                          BorderRadius.circular(24),

                      gradient: isSelected

                          ? const LinearGradient(
                              colors: [
                                Color(0xFF8BB8D9),
                                Color(0xFFD7A9C3),
                              ],
                            )

                          : null,

                      color: isSelected
                          ? null
                          : Colors.white,

                      boxShadow: [

                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.05),

                          blurRadius: 10,

                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Container(

                      decoration: BoxDecoration(

                        borderRadius:
                            BorderRadius.circular(20),

                        color: Colors.white,
                      ),

                      child: ClipRRect(

                        borderRadius:
                            BorderRadius.circular(18),

                        child: Image.asset(
                          avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(

            padding: const EdgeInsets.fromLTRB(
              20,
              10,
              20,
              25,
            ),

            child: SizedBox(

              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: () async {

                  await AvatarService.saveAvatar(
                    selectedAvatar,
                  );

                  Navigator.pop(
                    context,
                    selectedAvatar,
                  );
                },

                style: ElevatedButton.styleFrom(

                  backgroundColor:
                      const Color(0xFF7FA9C4),

                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                  ),
                ),

                child: const Text(

                  "Simpan Avatar",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}